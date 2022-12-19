import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:show_me_the_price/src/models/year.dart';

class YearBloc {
  List<Year> list = [];
  List<Year> listByName = [];

  final _listController = StreamController<List<Year>>();

  StreamController<List<Year>> get listController => _listController;

  getYears(String type, String mark, String model) async {
    var url = Uri.https('parallelum.com.br',
        'fipe/api/v1/$type/marcas/$mark/modelos/$model/anos');
    var response = await http.get(url);
    list = convertList(jsonDecode(response.body));
    _listController.add(list);
  }

  getYearByName(String name) {
    listByName = [];
    for (var element in list) {
      String nome = element.nome;
      if (nome.toLowerCase().contains(name.toLowerCase())) {
        listByName.add(Year(nome: element.nome, codigo: element.codigo));
      }
    }
    _listController.add(listByName);
  }

  List<Year> convertList(List<dynamic> lista) {
    List<Year> listaConvertida = [];
    for (var element in lista) {
      listaConvertida.add(Year(
          nome: element['nome'].toString(),
          codigo: element['codigo'].toString()));
    }
    return listaConvertida;
  }
}
