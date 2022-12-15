import 'package:flutter/material.dart';

class HeaderTitleComponent extends StatefulWidget {
  const HeaderTitleComponent({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  State<HeaderTitleComponent> createState() => _HeaderTitleComponentState();
}

class _HeaderTitleComponentState extends State<HeaderTitleComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Text(
        widget.text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 22),
      ),
    );
  }
}
