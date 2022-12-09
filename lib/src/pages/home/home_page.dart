import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:show_me_the_price/src/components/header_component.dart';
import 'package:show_me_the_price/src/components/home_card_component.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: const [
        HeaderComponent(),
        HomeCardComponent(
            type: 'motos', icon: Icons.motorcycle, nome: 'Motocicleta'),
        HomeCardComponent(
            type: 'carros', icon: CupertinoIcons.car_detailed, nome: 'Carro'),
        HomeCardComponent(
            type: 'caminhoes', icon: Icons.fire_truck, nome: 'Caminhão'),
      ],
    ));
  }
}
