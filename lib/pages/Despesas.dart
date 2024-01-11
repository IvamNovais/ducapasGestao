import 'package:flutter/material.dart';
import 'package:interno/models/Despesa.dart';
import 'package:interno/pages/CreateDespesa.dart';
import 'package:interno/services/DespesaServices.dart';

class Despesas extends StatefulWidget {
  const Despesas({super.key});

  @override
  State<Despesas> createState() => _DespesasState();
}

class _DespesasState extends State<Despesas> {
  List<Despesa> tabela = [];
  @override
  void initState() {
    super.initState();
    DespesaServices().obterTodasDespesas().then((List<Despesa> value) => {
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
            MaterialPageRoute(builder: (context) => const CreateDespesa()),
          );
        },
      ),
    );
  }
}
