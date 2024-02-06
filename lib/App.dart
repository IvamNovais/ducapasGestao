import 'package:flutter/material.dart';
import 'package:interno/pages/Aletas.dart';
import 'package:interno/pages/Clientes.dart';
import 'package:interno/pages/Encomendas.dart';
import 'package:interno/pages/Financeiro.dart';
import 'package:interno/pages/Marcas.dart';
import 'package:interno/pages/Produtos.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  List<Tab> tabs = <Tab>[
    const Tab(text: 'Home'),
    const Tab(text: 'Produtos'),
    const Tab(text: 'Marcas'),
    const Tab(text: 'Financeiro'),
    const Tab(text: 'Vendas'),
    const Tab(text: 'Clientes'),
    const Tab(text: 'Fornecedores'),
    const Tab(text: 'Encomendas'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
              bottom: TabBar(
                tabs: tabs,
              ),
              title: const Text("Du Capas"),
              backgroundColor: Colors.blue,
              automaticallyImplyLeading: false),
          body: const TabBarView(
            children: <Widget>[
              Alertas(),
              Produtos(),
              Marcas(),
              Financeiro(),
              Text('Vendas'),
              Clientes(),
              Text('fornecedores'),
              Encomendas()
            ],
          ),
        );
      }),
    ));
  }
}
