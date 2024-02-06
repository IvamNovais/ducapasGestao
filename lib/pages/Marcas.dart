import 'package:flutter/material.dart';
import 'package:interno/models/Marca.dart';
import 'package:interno/pages/CreateMarca.dart';
import 'package:interno/services/MarcaServices.dart';

class Marcas extends StatefulWidget {
  const Marcas({super.key});

  @override
  State<Marcas> createState() => _MarcasState();
}

class _MarcasState extends State<Marcas> {
  List<Marca> tabela = [];
  @override
  void initState() {
    super.initState();
    MarcaServices().obterTodosMarcas().then((List<Marca> value) => {
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
                title: Text(tabela[index].nome),
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
            MaterialPageRoute(builder: (context) => const CreateMarca()),
          );
        },
      ),
    );
  }
}
