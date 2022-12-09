import 'package:flutter/material.dart';
import 'package:show_me_the_price/src/components/main_list_component_bloc.dart';

class MainListComponent extends StatelessWidget {
  const MainListComponent(
      {Key? key,
      required this.lista,
      required this.route,
      required this.type,
      this.mark,
      this.model,
      this.year,})
      : super(key: key);
  final List<dynamic> lista;
  final String route;
  final String type;
  final mark;
  final model;
  final year;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            route,
            arguments: MainListComponentBloc()
                .setupNextList(type, route, mark, model, year, lista[i]['codigo']),
          ),
          child: Card(
            margin: const EdgeInsets.all(18),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              child: InkWell(
                child: Text(
                  '${lista[i]['nome']}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
