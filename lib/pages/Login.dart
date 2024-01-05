import 'package:flutter/material.dart';
import 'package:interno/App.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final mailController = TextEditingController();
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Du Capas"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset("assets/image/logo2.jpeg"),
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Login")),
                  controller: mailController,
                  validator: (value)  {
                    if(value == null|| value.isEmpty){
                      return "preencha o e-mail";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Senha")),
                  obscureText: true,
                  controller: passController,
                  validator: (value)  {
                    if(value == null|| value.isEmpty){
                      return "preencha a senha";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const App()),
                  );
                  }
                }, child: const Text("Entrar"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
