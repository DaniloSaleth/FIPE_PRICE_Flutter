import 'package:show_me_the_price/src/pages/mark/mark_args.dart';
import 'package:show_me_the_price/src/pages/model/model_args.dart';
import 'package:show_me_the_price/src/pages/year/year_args.dart';

import '../pages/price/price_args.dart';

class MainListComponentBloc {
  setupNextList(
    String type,
    String route,
    mark,
    model,
    year,
    codigo,
  ) {
    switch (route) {
      case '/model':
        mark = codigo.toString();
        return ModelArgs(type, mark);

      case '/year':
        model = codigo.toString();
        return YearArgs(type, mark, model);

      case '/price':
        year = codigo.toString();
        return PriceArgs(type, mark, model, year);
    }
  }
}
