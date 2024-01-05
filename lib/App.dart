import 'package:flutter/material.dart';
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Du Capas"),
          backgroundColor: Colors.blue,
        ),
        body: DefaultTabController(
          length: tabs.length,
          // The Builder widget is used to have a different BuildContext to access
          // closest DefaultTabController.
          child: Builder(builder: (BuildContext context) {
            final TabController tabController =
                DefaultTabController.of(context);
            tabController.addListener(() {
              if (!tabController.indexIsChanging) {
                // Your code goes here.
                // To get index of current tab use tabController.index
              }
            });
            return Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: tabs,
                ),
              ),
              body: const TabBarView(
                children: <Widget>[
                  Text("Primeira guia selecionada"),
                  Produtos()
                ],
              ),
            );
          }),
        ));
  }
}
