import 'package:flutter/material.dart';
import 'package:show_me_the_price/src/components/search_header_component.dart';
import 'mark_args.dart';
import 'mark_bloc.dart';

class MarkPage extends StatelessWidget {
  const MarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MarkArgs;

    return Scaffold(
      body: Column(
        children: [
          const SearchHeaderComponent(
            hintText: 'Busque por uma marca',
            text: 'Selecione a marca de veículo',
          ),
          Expanded(
            child: FutureBuilder(
              future: MarkBloc().getMarks(args.type),
              builder: (context, snapshot) {
                return MarkBloc().responseFuture(snapshot);
              },
            ),
          )
        ],
      ),
    );
  }
}
