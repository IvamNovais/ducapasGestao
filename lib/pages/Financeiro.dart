import 'package:flutter/material.dart';
import 'package:interno/pages/Despesas.dart';
import 'package:interno/pages/Receitas.dart';

class Financeiro extends StatefulWidget {
  const Financeiro({super.key});

  @override
  State<Financeiro> createState() => _FinanceiroState();
}

class _FinanceiroState extends State<Financeiro> {
  List<Tab> tabs = <Tab>[
    const Tab(text: 'A pagar'),
    const Tab(text: 'A receber'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
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
              Despesas(),
              Receitas(),
            ],
          ),
        );
      }),
    ));
  }
}
