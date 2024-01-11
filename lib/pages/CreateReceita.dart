import 'package:flutter/material.dart';
import 'package:interno/App.dart';
import 'package:interno/models/Receita.dart';
import 'package:interno/services/ReceitasServices.dart';


class CreateReceita extends StatefulWidget {
  const CreateReceita({super.key});

  @override
  State<CreateReceita> createState() => _CreateReceitaState();
}

class _CreateReceitaState extends State<CreateReceita> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController idController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  TextEditingController prazoController = TextEditingController();
  TextEditingController jurosController = TextEditingController();
  TextEditingController recebidoController = TextEditingController();
  TextEditingController diaPagamentoController = TextEditingController();
  TextEditingController diaCriacaoController = TextEditingController();

  Receita criarReceita() {
    return Receita(
        id: idController.text,
        descricao: descricaoController.text,
        valor: double.parse(valorController.text),
        juros: double.parse(jurosController.text),
        prazo: DateTime.now(),
        recebido: bool.parse(recebidoController.text),
        diaPagamento: DateTime.now(),
        diaCriacao: DateTime.now());
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
                        decoration: const InputDecoration(labelText: 'Valor'),
                        controller: valorController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "preencha a Valor";
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
                        decoration: const InputDecoration(labelText: 'Prazo'),
                        controller: prazoController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "preencha o Prazo";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 30.0),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Pago'),
                        controller: recebidoController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "preencha se foi pago";
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
                            const InputDecoration(labelText: 'Preco de dia p'),
                        controller: diaPagamentoController,
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
                            const InputDecoration(labelText: 'Preco de dia v'),
                        controller: diaCriacaoController,
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
                            Receita receita = criarReceita();
                            ReceitaServices().salvarReceita(receita);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const App()),
                            );
                          }
                        },
                        child: const Text("Salvar")),
                    const SizedBox(width: 20.0),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Receita receita = criarReceita();
                            ReceitaServices().salvarReceita(receita);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const App()),
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
