import 'package:flutter/material.dart';
import 'package:interno/App.dart';
import 'package:interno/models/Marca.dart';
import 'package:interno/services/MarcaServices.dart';

class CreateMarca extends StatefulWidget {
  const CreateMarca({super.key});

  @override
  State<CreateMarca> createState() => _CreateMarcaState();
}

class _CreateMarcaState extends State<CreateMarca> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController categoriaController = TextEditingController();
  final TextEditingController precoCustoController = TextEditingController();
  final TextEditingController precoVendaController = TextEditingController();
  final TextEditingController marcaController = TextEditingController();
  final TextEditingController quantidadeEstoqueController =
      TextEditingController();
  final TextEditingController quantidadeEstoqueMinimaController =
      TextEditingController();

  Marca criarMarca() {
    String nome = descricaoController.text;

    return Marca(
      id: '',
      nome: nome,
      produtos: []
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
                )
              ],
            ),
            const SizedBox(height: 30.0),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Marca marca = criarMarca();
                        MarcaServices().salvarMarca(marca);
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
                        Marca marca = criarMarca();
                        MarcaServices().salvarMarca(marca);
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
