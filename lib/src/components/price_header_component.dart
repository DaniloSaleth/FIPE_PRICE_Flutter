import 'package:flutter/material.dart';

class PriceHeaderComponent extends StatelessWidget {
  const PriceHeaderComponent({Key? key}) : super(key: key);

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
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Image(
                    height: 66,
                    width: 66,
                    image: AssetImage(
                      'lib/src/images/ic_app_logo.png',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      bottom: 8,
                      left: 32,
                    ),
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
              const SizedBox(
                height: 200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
