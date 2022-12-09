import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'lib/src/images/half_circle_header.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Image(
                    height: 66,
                    width: 66,
                    image: AssetImage('lib/src/images/ic_app_logo.png'),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 8, left: 32),
                    child: const Text(
                      'Show Me The Price',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),
              const Text(
                'Para encontrar o preço de um veículo na \n\n'
                'tabela FIPE siga as instruções abaixo:',
                style: TextStyle(height: 0.6, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              const Text(
                'Selecione o tipo de veículo',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
