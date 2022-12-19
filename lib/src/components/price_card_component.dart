import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:show_me_the_price/src/models/price.dart';

class PriceCardComponent extends StatelessWidget {
  const PriceCardComponent({
    Key? key,
    required this.price,
  }) : super(key: key);

  final Price price;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 300,
        height: 320,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 48,
                  width: 48,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: const Color(0xFFFFDD4B),
                    child: const Icon(
                      CupertinoIcons.car_detailed,
                      size: 32,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 32),
                  child: Text(
                    price.Modelo,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 16),
              child: const Divider(
                height: 8,
                color: Colors.black12,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 4),
                  child: const Text(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    'Marca:',
                  ),
                ),
                Text(
                  price.Marca,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 32, right: 4),
                  child: const Text(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    'Ano:',
                  ),
                ),
                Text(
                  price.AnoModelo,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 4),
                  child: const Text(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    'Codigo FIPE:',
                  ),
                ),
                Text(
                price.CodigoFipe,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 4),
                  child: const Text(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    'Combustível:',
                  ),
                ),
                Text(
                  '${price.Combustivel} - ${price.SiglaCombustivel}',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16, bottom: 16),
              child: const Divider(
                height: 8,
                color: Colors.black12,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 4),
                  child: const Text(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    'Mês Referência:',
                  ),
                ),
                Text(
                price.MesReferencia,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16, bottom: 16),
              child: const Divider(
                height: 8,
                color: Colors.black12,
              ),
            ),
            Text(
                price.Valor,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
