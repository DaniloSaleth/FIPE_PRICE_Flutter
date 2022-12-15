import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:show_me_the_price/src/components/price_card_component.dart';
import 'package:show_me_the_price/src/pages/price/price_args.dart';
import 'package:show_me_the_price/src/pages/price/price_bloc.dart';

import '../../components/price_header_component.dart';

class PricePage extends StatefulWidget {
  const PricePage({Key? key}) : super(key: key);

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  late PriceBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = GetIt.I();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PriceArgs;
    bloc.getPrice(args.type, args.mark, args.model, args.year);
    return Scaffold(
      body: StreamBuilder<dynamic>(
          stream: bloc.priceController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const PriceHeaderComponent(),
                  PriceCardComponent(
                    price: snapshot.data,
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
