import 'package:flutter/material.dart';
import 'package:interno/models/Cliente.dart';
import 'package:interno/pages/CreateClienete.dart';
import 'package:interno/services/ClienteServices.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  State<Clientes> createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  List<Cliente> tabela = [];
  @override
  void initState() {
    super.initState();
    ClienteServices().obterTodosClientes().then((List<Cliente> value) => {
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
                leading: Text(tabela[index].nomeRazaoSocial),
                title: Text(tabela[index].cpfCnpj),
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
            MaterialPageRoute(builder: (context) => const CreateCliente()),
          );
        },
      ),
    );
  }
}
