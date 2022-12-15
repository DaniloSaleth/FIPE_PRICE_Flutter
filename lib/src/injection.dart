import 'package:get_it/get_it.dart';
import 'package:show_me_the_price/src/pages/mark/mark_bloc.dart';
import 'package:show_me_the_price/src/pages/model/model_bloc.dart';
import 'package:show_me_the_price/src/pages/price/price_bloc.dart';
import 'package:show_me_the_price/src/pages/year/year_bloc.dart';

injection(){
  final get = GetIt.instance;

  //bloc
  get.registerFactory(() => MarkBloc());
  get.registerFactory(() => ModelBloc());
  get.registerFactory(() => YearBloc());
  get.registerFactory(() => PriceBloc());
}