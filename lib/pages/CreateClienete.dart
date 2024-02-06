import 'package:flutter/material.dart';
import 'package:interno/App.dart';
import 'package:interno/models/Cliente.dart';
import 'package:interno/models/Endereco.dart';
import 'package:interno/models/User.dart';
import 'package:interno/services/ClienteServices.dart';

class CreateCliente extends StatefulWidget {
  const CreateCliente({Key? key}) : super(key: key);

  @override
  State<CreateCliente> createState() => _CreateClienteState();
}

class _CreateClienteState extends State<CreateCliente> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cpfCnpjController = TextEditingController();
  final TextEditingController ruaController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController bairroController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();

  Cliente criarCliente() {
    String nomeRazaoSocial = nomeController.text;
    String cpfCnpj = cpfCnpjController.text;

    return Cliente(
      id: '', // O ID será gerado automaticamente pelo banco de dados
      user: User(
          id: '',
          nome: nomeRazaoSocial,
          login: cpfCnpj,
          password: "teste",
          role:
              'ROLE_CLIENTE'), // Você precisa definir a lógica para associar um usuário aqui
      nomeRazaoSocial: nomeRazaoSocial,
      cpfCnpj: cpfCnpj,
      endereco: Endereco(
        id: '', // O ID será gerado automaticamente pelo banco de dados
        rua: ruaController.text,
        numero: numeroController.text,
        bairro: bairroController.text,
        cidade: cidadeController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Cliente"),
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
                    child: TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Nome/Razão Social'),
                      controller: nomeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Preencha o Nome/Razão Social";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'CPF/CNPJ'),
                      controller: cpfCnpjController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Preencha o CPF/CNPJ";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Rua'),
                      controller: ruaController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Preencha a Rua";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Número'),
                      controller: numeroController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Preencha o Número";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Bairro'),
                      controller: bairroController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Preencha o Bairro";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Cidade'),
                      controller: cidadeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Preencha a Cidade";
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
                        Cliente cliente = criarCliente();
                        ClienteServices().salvarCliente(cliente);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const App()),
                        );
                      }
                    },
                    child: const Text("Salvar"),
                  ),
                  const SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Volta para a tela anterior
                    },
                    child: const Text("Cancelar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
