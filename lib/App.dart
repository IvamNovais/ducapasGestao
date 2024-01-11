import 'package:flutter/material.dart';
import 'package:interno/pages/Aletas.dart';
import 'package:interno/pages/Financeiro.dart';
import 'package:interno/pages/Produtos.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  List<Tab> tabs = <Tab>[
    const Tab(text: 'Home'),
    const Tab(text: 'produtos'),
    const Tab(text: 'Financeiro'),
    const Tab(text: 'Vendas'),
    const Tab(text: 'Clientes'),
    const Tab(text: 'Fornecedores'),
    const Tab(text: 'Encomendas'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Du Capas"),
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
        ),
        body: DefaultTabController(
          length: tabs.length,
          // The Builder widget is used to have a different BuildContext to access
          // closest DefaultTabController.
          child: Builder(builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: tabs,
                ),
              ),
              body: const TabBarView(
                children: <Widget>[
                  Alertas(),
                  Produtos(),
                  Financeiro(),
                  Text('Vendas'),
                  Text('clientes'),
                  Text('fornecedores'),
                  Text('Encomendas'),
                ],
              ),
            );
          }),
        ));
  }
}
