import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MarkBloc {
  List<dynamic> list = [];
  List<dynamic> listByName = [];

  final _listController = StreamController<List<dynamic>>();

  StreamController<List<dynamic>> get listController => _listController;

  getMarks(String type) async {
    var url = Uri.https('parallelum.com.br', 'fipe/api/v1/$type/marcas');
    var response = await http.get(url);
    list = jsonDecode(response.body);
    _listController.add(list);
  }

  getMarksByName(String name) {
    listByName = [];
    for (var element in list) {
      String nome = element['nome'];
      if (nome.toLowerCase().contains(name.toLowerCase())) {
        listByName.add({
          'nome': element['nome'],
          'codigo': element['codigo'],});
      }
    }
    _listController.add(listByName);
  }
}
