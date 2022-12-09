import 'package:show_me_the_price/src/pages/year/year_page.dart';

import '../pages/home/home_page.dart';
import '../pages/mark/mark_page.dart';
import '../pages/model/model_page.dart';
import '../pages/price/price_page.dart';

class AppRoutes {
  final routes = {
    '/': (context) => HomePage(),
    '/mark': (_) => MarkPage(),
    '/model': (_) => ModelPage(),
    '/year': (_) => YearPage(),
    '/price': (_) => PricePage(),
  };
}
