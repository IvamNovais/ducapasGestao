import 'package:flutter/material.dart';
import 'package:interno/models/Produto.dart';
import 'package:interno/pages/CreateProduto.dart';
import 'package:interno/services/ProdutoServices.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  List<Produto> tabela = [];
  @override
  void initState() {
    super.initState();
    ProdutoServices().obterTodosProdutos().then((List<Produto> value) => {
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
                leading: Text(tabela[index].categoria),
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
            MaterialPageRoute(builder: (context) => const CreateProduto()),
          );
        },
      ),
    );
  }
}
