import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:show_me_the_price/src/models/model.dart';

class ModelBloc {
  List<Model> list = [];
  List<Model> listByName = [];

  final _listController = StreamController<List<Model>>();

  StreamController<List<Model>> get listController => _listController;

  getModels(String type, String mark) async {
    var url = Uri.https(
        'parallelum.com.br', 'fipe/api/v1/$type/marcas/$mark/modelos');
    var response = await http.get(url);
    list = convertList(jsonDecode(response.body)['modelos']);
    _listController.add(list);
  }

  getModelsByName(String name) {
    listByName = [];
    for (var element in list) {
      String nome = element.nome;
      if (nome.toLowerCase().contains(name.toLowerCase())) {
        listByName.add(Model(nome: element.nome, codigo: element.nome));
      }
    }
    _listController.add(listByName);
  }

  List<Model> convertList(List<dynamic> lista) {
    List<Model> listaConvertida = [];
    for (var element in lista) {
      listaConvertida.add(Model(
          nome: element['nome'].toString(),
          codigo: element['codigo'].toString()));
    }
    return listaConvertida;
  }
}
