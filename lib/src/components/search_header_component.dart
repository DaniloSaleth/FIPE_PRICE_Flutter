import 'package:flutter/material.dart';

class SearchHeaderComponent extends StatelessWidget {
  const SearchHeaderComponent(
      {Key? key, required this.hintText, required this.text})
      : super(key: key);
  final String hintText;
  final String text;

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
              const SizedBox(height: 25),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 15),
              Container(
                width: 330,
                height: 55,
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFffdd99),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none),
                    hintStyle: const TextStyle(
                      color: Color(0xFF888888),
                    ),
                    hintText: hintText,
                  ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ],
      ),
    );
    ;
  }
}
