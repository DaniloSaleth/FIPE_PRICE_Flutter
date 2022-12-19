import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:show_me_the_price/src/models/price.dart';

class PriceBloc {
  dynamic price = {};

  final _priceController = StreamController<Price>();

  StreamController<Price> get priceController => _priceController;

  getPrice(String type, String mark, String model, String year) async {
    var url = Uri.https('parallelum.com.br',
        'fipe/api/v1/$type/marcas/$mark/modelos/$model/anos/$year');
    var response = await http.get(url);
    price = dynamicToPrice(jsonDecode(response.body));
    _priceController.add(price);
  }

  Price dynamicToPrice(dynamic price) {
    Price converted = Price(
      Modelo: price['Modelo'],
      Marca: price['Marca'],
      AnoModelo: price['AnoModelo'].toString(),
      CodigoFipe: price['CodigoFipe'],
      Combustivel: price['Combustivel'],
      SiglaCombustivel: price['SiglaCombustivel'],
      MesReferencia: price['MesReferencia'],
      Valor: price['Valor'],
    );

    return converted;
  }
}
