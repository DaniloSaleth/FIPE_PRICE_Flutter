import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:show_me_the_price/src/models/mark.dart';

class MarkBloc {
  List<Mark> list = [];
  List<Mark> listByName = [];

  final _listController = StreamController<List<Mark>>();

  StreamController<List<Mark>> get listController => _listController;

  getMarks(String type) async {
    var url = Uri.https('parallelum.com.br', 'fipe/api/v1/$type/marcas');
    var response = await http.get(url);
    list = convertList(jsonDecode(response.body));
    _listController.add(list);
  }

  getMarksByName(String name) {
    listByName = [];
    for (var element in list) {
      String nome = element.nome;
      if (nome.toLowerCase().contains(name.toLowerCase())) {
        listByName.add(Mark(nome: element.nome, codigo: element.codigo));
      }
    }
    _listController.add(listByName);
  }

  List<Mark> convertList(List<dynamic> lista) {
    List<Mark> listaConvertida = [];
    for (var element in lista) {
      listaConvertida
          .add(Mark(nome: element['nome'], codigo: element['codigo']));
    }
    return listaConvertida;
  }
}
