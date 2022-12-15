import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ModelBloc {
  List<dynamic> list = [];
  List<dynamic> listByName = [];

  final _listController = StreamController<List<dynamic>>();

  StreamController<List<dynamic>> get listController => _listController;

  getModels(String type, String mark) async {
    var url = Uri.https(
        'parallelum.com.br', 'fipe/api/v1/$type/marcas/$mark/modelos');
    var response = await http.get(url);
    list = jsonDecode(response.body)['modelos'];
    _listController.add(list);
  }

  getModelsByName(String name) {
    listByName = [];
    for (var element in list) {
      String nome = element['nome'];
      if (nome.toLowerCase().contains(name.toLowerCase())) {
        listByName.add({
          'nome': element['nome'],
          'codigo': element['codigo'],
        });
      }
    }
    _listController.add(listByName);
  }
}
