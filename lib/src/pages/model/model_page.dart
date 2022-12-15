import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:show_me_the_price/src/components/app_title_component.dart';
import 'package:show_me_the_price/src/components/header_title_component.dart';
import 'package:show_me_the_price/src/components/list_item_component.dart';
import 'package:show_me_the_price/src/components/not_found_component.dart';
import 'package:show_me_the_price/src/pages/model/model_args.dart';
import 'package:show_me_the_price/src/pages/model/model_bloc.dart';
import 'package:show_me_the_price/src/pages/year/year_args.dart';

class ModelPage extends StatefulWidget {
  const ModelPage({Key? key}) : super(key: key);

  @override
  _ModelPageState createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  late final ModelBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = GetIt.I();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ModelArgs;
    bloc.getModels(args.type, args.mark);
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
                        text: 'Selecione o modelo do veículo'),
                    Container(
                      margin: const EdgeInsets.only(bottom: 60),
                      width: 330,
                      height: 55,
                      child: TextField(
                        onChanged: (value) => bloc.getModelsByName(value),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFffdd99),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide.none),
                          hintStyle: const TextStyle(color: Color(0xFF888888)),
                          hintText: 'Busque por um modelo',
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
                      text: 'Nenhum Modelo Encontrado',
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
                            '/year',
                            arguments: YearArgs(
                              args.type,
                              args.mark,
                              item['codigo'].toString(),
                            ),
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
          )
        ],
      ),
    );
  }
}
