import 'package:flutter/widgets.dart';

class AppTitleComponent extends StatelessWidget {
  const AppTitleComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 25),
      child: Row(
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
    );
  }
}
