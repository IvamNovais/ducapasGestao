import 'package:flutter/material.dart';
import 'package:interno/models/Encomenda.dart';
import 'package:interno/pages/CreateEncomenda.dart';
import 'package:interno/services/EncomendaServices.dart';

class Encomendas extends StatefulWidget {
  const Encomendas({super.key});

  @override
  State<Encomendas> createState() => _EncomendasState();
}

class _EncomendasState extends State<Encomendas> {
  List<Encomenda> tabela = [];
  @override
  void initState() {
    super.initState();
    EncomendaServices().obterTodosEncomendas().then((List<Encomenda> value) => {
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
                leading: Text(tabela[index].status),
                title: Text(tabela[index].comprador.nomeRazaoSocial),
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
            MaterialPageRoute(builder: (context) => const CreateEncomenda()),
          );
        },
      ),
    );
  }
}
