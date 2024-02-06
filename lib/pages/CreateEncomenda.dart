import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:interno/models/Cliente.dart';
import 'package:interno/models/Encomenda.dart';
import 'package:interno/models/PedidoEncomenda.dart';
import 'package:interno/models/Produto.dart';
import 'package:interno/services/ClienteServices.dart';
import 'package:interno/services/ProdutoServices.dart';

class CreateEncomenda extends StatefulWidget {
  const CreateEncomenda({Key? key}) : super(key: key);

  @override
  State<CreateEncomenda> createState() => _CreateEncomendaState();
}

class _CreateEncomendaState extends State<CreateEncomenda> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController compradorNomeController = TextEditingController();
  final TextEditingController compradorCpfCnpjController =
      TextEditingController();
  final TextEditingController dataEncomendaController = TextEditingController();
  final TextEditingController dataEntregaController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController clienteController = TextEditingController();
  List<Widget> inputFields = [];
  List<TextEditingController> textEditingControllersMercadoria = [];
  List<TextEditingController> textEditingControllersQuatidade = [];
  addInput() {
    TextEditingController quantidade = TextEditingController();
    textEditingControllersQuatidade.add(quantidade);
    inputFields.add(
      Row(
        children: [
          Expanded(
              child: DropdownMenu(
            label: const Text(
              'Escolha o produto ',
            ),
            dropdownMenuEntries: produtos.map((Produto val) {
              return DropdownMenuEntry(
                value: val,
                label: val.descricao,
              );
            }).toList(),
          )),
          const SizedBox(width: 16.0),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Quantidade'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "preencha a Quantidade";
                }
                return null;
              },
              controller: quantidade,
            ),
          ),
        ],
      ),
    );
  }

  List<PedidoEncomenda> pedidos = [];
  List<Cliente> clientes = [];
  Cliente? clienteEncomenda;
  List<Produto> produtos = [];
  List<Produto> produtosEncomenda = [];
  @override
  void initState() {
    super.initState();
    ProdutoServices().obterTodosProdutos().then((List<Produto> value) => {
          setState(() {
            produtos = value;
          })
        });
    ClienteServices().obterTodosClientes().then((List<Cliente> value) => {
          setState(() {
            clientes = value;
          })
        });
  }

  Encomenda criarEncomenda() {
    String id = idController.text;

    DateTime dataEncomenda = DateTime.parse(dataEncomendaController.text);
    DateTime dataEntrega = DateTime.parse(dataEntregaController.text);
    String status = statusController.text;

    return Encomenda(
      id: id,
      comprador: clienteEncomenda!,
      dataEncomenda: dataEncomenda,
      dataEntrega: dataEntrega,
      pedidos: pedidos,
      status: status,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova Encomenda"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: DropdownMenu(
                    label: const Text(
                      'Escolha o cliente ',
                    ),
                    onSelected: (value) => {
                      clienteEncomenda = value
                    },
                    dropdownMenuEntries: clientes.map((Cliente val) {
                      return DropdownMenuEntry(
                        value: val,
                        label: val.nomeRazaoSocial,
                      );
                    }).toList(),
                  )),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Data da Encomenda (YYYY-MM-DD)'),
                      controller: dataEncomendaController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Preencha a Data da Encomenda";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                child: Column(
                  children: inputFields,
                ),
              ),
              const SizedBox(height: 32.0),
              Row(children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            addInput();
                          });
                        },
                        child: const Text("Add Mercadoria"))),
                const SizedBox(width: 16.0),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {});
                          }
                        },
                        child: const Text("Salvar"))),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
