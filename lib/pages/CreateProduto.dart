import 'package:flutter/material.dart';
import 'package:interno/App.dart';

class CreateProduto extends StatefulWidget {
  const CreateProduto({super.key});

  @override
  State<CreateProduto> createState() => _CreateProdutoState();
}

class _CreateProdutoState extends State<CreateProduto> {
  final _formKey = GlobalKey<FormState>();
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
            child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Nome'),
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
                    decoration: const InputDecoration(labelText: 'Preco de Custo'),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const App()),
                        );
                      }
                    },
                    child: const Text("Sakvar")),
                const SizedBox(width: 20.0),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
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
