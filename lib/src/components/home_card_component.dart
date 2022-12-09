import 'package:flutter/material.dart';
import 'package:show_me_the_price/src/pages/mark/mark_args.dart';

class HomeCardComponent extends StatelessWidget {
  const HomeCardComponent({Key? key, required this.type, required this.icon, required this.nome}) : super(key: key);
  final String type;
  final String nome;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 20),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/mark',arguments: MarkArgs(type)),
        child: Container(
          width: 130,
          height: 130,
          padding: const EdgeInsets.all(
            8,
          ),
          decoration: const BoxDecoration(
            color: Color(
              0xFFFFDD4B,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      15,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      icon,
                      size: 70,
                    ),
                    const SizedBox(height: 5),
                    Text(nome),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
