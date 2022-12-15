import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:show_me_the_price/src/components/app_title_component.dart';
import 'package:show_me_the_price/src/components/header_title_component.dart';
import 'package:show_me_the_price/src/components/list_item_component.dart';
import 'package:show_me_the_price/src/components/not_found_component.dart';
import 'package:show_me_the_price/src/pages/mark/mark_args.dart';
import 'package:show_me_the_price/src/pages/mark/mark_bloc.dart';
import 'package:show_me_the_price/src/pages/model/model_args.dart';


class MarkPage extends StatefulWidget {
  const MarkPage({
    Key? key,
  }) : super(key: key);

  @override
  _MarkPageState createState() => _MarkPageState();
}

class _MarkPageState extends State<MarkPage> {
  late final MarkBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = GetIt.I();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MarkArgs;
    bloc.getMarks(args.type);
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/src/images/half_circle_header.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const AppTitleComponent(),
                    const HeaderTitleComponent(
                        text: 'Selecione a marca do veículo'),
                    Container(
                      margin: const EdgeInsets.only(bottom: 60),
                      width: 330,
                      height: 55,
                      child: TextField(
                        onChanged: (value) => bloc.getMarksByName(value),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFffdd99),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide.none),
                          hintStyle: const TextStyle(color: Color(0xFF888888)),
                          hintText: 'Busque por uma marca',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<dynamic>>(
              stream: bloc.listController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return const NotFountComponent(
                      text: 'Nenhuma Marca Encontrada',
                    );
                  }
                  return Center(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, i) {
                        var item = snapshot.data![i];
                        return InkWell(
                          onTap: () => Navigator.pushNamed(
                            context,
                            '/model',
                            arguments: ModelArgs(args.type, item['codigo']),
                          ),
                          child: ListItemComponent(
                            name: item['nome'],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
