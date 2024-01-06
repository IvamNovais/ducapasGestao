import 'package:flutter/material.dart';
import 'package:interno/models/Produto.dart';
import 'package:interno/services/AlertaServices.dart';

class Alertas extends StatefulWidget {
  const Alertas({super.key});

  @override
  State<Alertas> createState() => _AlertasState();
}

class _AlertasState extends State<Alertas> {
  List<Produto> tabela = [];
  @override
  void initState() {
    super.initState();
    AlertaServices().getAlertasEstoque().then((List<Produto> value) => {
          setState(() {
            tabela = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Icon(Icons.warning),
                title:
                    Text("${tabela[index].descricao} esta com o estoque baixo"),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.arrow_drop_down_circle_outlined),
                ));
          },
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: tabela.length),
    );
  }
}
