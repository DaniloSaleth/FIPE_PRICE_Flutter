import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:show_me_the_price/src/components/main_list_component.dart';

class MarkBloc {
  Future<Widget> getMarks(String type) async {
    var url = Uri.https('parallelum.com.br', 'fipe/api/v1/$type/marcas');
    var response = await http.get(url);
    var lista = jsonDecode(response.body);
    return MainListComponent(lista: lista, route: '/model', type: type,);
  }

  Widget responseFuture(AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      return Center(
        child: snapshot.data,
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
