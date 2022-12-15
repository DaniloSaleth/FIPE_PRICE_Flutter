import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:show_me_the_price/src/components/price_card_component.dart';

class PriceBloc {
  dynamic price = {};

  final _priceController = StreamController<dynamic>();

  StreamController<dynamic> get priceController => _priceController;

  getPrice(
      String type, String mark, String model, String year) async {
    var url = Uri.https('parallelum.com.br',
        'fipe/api/v1/$type/marcas/$mark/modelos/$model/anos/$year');
    var response = await http.get(url);
    price = jsonDecode(response.body);
    _priceController.add(price);
  }
}
