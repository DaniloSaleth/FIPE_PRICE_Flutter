import 'package:flutter/material.dart';
import 'package:show_me_the_price/src/routes/app_routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: AppRoutes().routes,
      debugShowCheckedModeBanner: false,
    );
  }
}