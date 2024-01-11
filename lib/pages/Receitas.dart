import 'package:flutter/material.dart';
import 'package:interno/models/Receita.dart';
import 'package:interno/pages/CreateReceita.dart';
import 'package:interno/services/ReceitasServices.dart';

class Receitas extends StatefulWidget {
  const Receitas({super.key});

  @override
  State<Receitas> createState() => _ReceitasState();
}

class _ReceitasState extends State<Receitas> {
  List<Receita> tabela = [];
  // @override
  // void initState() {
  //   super.initState();
  //   ReceitaServices().obterTodasReceitas().then((List<Receita> value) => {
  //         setState(() {
  //           tabela = value;
  //         })
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: Text(tabela[index].id),
                title: Text(tabela[index].descricao),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.arrow_drop_down_circle_outlined),
                ));
          },
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: tabela.length),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateReceita()),
          );
        },
      ),
    );
  }
}
