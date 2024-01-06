import 'package:flutter/material.dart';
import 'package:interno/models/Login.dart';
import 'package:interno/services/LoginServices.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final mailController = TextEditingController();
  final passController = TextEditingController();
  LoginServices loginServices = LoginServices();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Du Capas"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 500,
                    child: Image.asset("assets/image/logo2.jpeg"),
                  ),
                  SizedBox(
                    width: 500,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(label: Text("Login")),
                          controller: mailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "preencha o e-mail";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(label: Text("Senha")),
                          obscureText: true,
                          controller: passController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "preencha a senha";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          loginServices.logar(
                              LoginModel(
                                  login: mailController.text,
                                  password: passController.text),
                              context);
                        }
                      },
                      child: const Text("Entrar"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
