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
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        return Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: tabs,
            ),
            automaticallyImplyLeading: false
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
