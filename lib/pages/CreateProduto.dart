import 'package:flutter/material.dart';
import 'package:interno/App.dart';
import 'package:interno/models/Produto.dart';
import 'package:interno/services/ProdutoServices.dart';

class CreateProduto extends StatefulWidget {
  const CreateProduto({super.key});

  @override
  State<CreateProduto> createState() => _CreateProdutoState();
}

class _CreateProdutoState extends State<CreateProduto> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController categoriaController = TextEditingController();
  final TextEditingController precoCustoController = TextEditingController();
  final TextEditingController precoVendaController = TextEditingController();
  final TextEditingController quantidadeEstoqueController =
      TextEditingController();
  final TextEditingController quantidadeEstoqueMinimaController =
      TextEditingController();

  Produto criarProduto() {
    String descricao = descricaoController.text;
    String categoria = categoriaController.text;
    double precoCusto = double.parse(precoCustoController.text);
    double precoVenda = double.parse(precoVendaController.text);
    int quantidadeEstoque = int.parse(quantidadeEstoqueController.text);
    int quantidadeEstoqueMinima =
        int.parse(quantidadeEstoqueMinimaController.text);

    return Produto(
      id: '',
      descricao: descricao,
      categoria: categoria,
      precoCusto: precoCusto,
      precoVenda: precoVenda,
      quantidadeEstoque: quantidadeEstoque,
      quantidadeEstoqueMinima: quantidadeEstoqueMinima,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Du Capas"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(150),
        child: Form(
          key: _formKey,
            child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Nome'),
                    controller: descricaoController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "preencha o Nome";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 30.0),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Categoria'),
                    controller: categoriaController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "preencha a Catedoria";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Estoque'),
                    controller: quantidadeEstoqueController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "preencha o Estoque";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 30.0),
                Expanded(
                  child: TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Estoque Minimo'),
                    controller: quantidadeEstoqueMinimaController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "preencha o Estoque";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Preco de Custo'),
                    controller: precoCustoController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "preencha o Preco de Custo";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 30.0),
                Expanded(
                  child: TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Preco de Venda'),
                    controller: precoVendaController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "preencha o Preco de  Venda";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Produto produto = criarProduto();
                        ProdutoService().salvarProduto(produto);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const App()),
                        );
                      }
                    },
                    child: const Text("Salvar")),
                const SizedBox(width: 20.0),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Produto produto = criarProduto();
                        ProdutoService().salvarProduto(produto);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const App()),
                        );
                      }
                    },
                    child: const Text("Cancelar"))
              ],
            )
          ],
        )),
      ),
    );
  }
}
