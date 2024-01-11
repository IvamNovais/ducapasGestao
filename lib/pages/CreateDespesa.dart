import 'package:flutter/material.dart';
import 'package:interno/App.dart';
import 'package:interno/models/Despesa.dart';
import 'package:interno/services/DespesaServices.dart';

class CreateDespesa extends StatefulWidget {
  const CreateDespesa({super.key});

  @override
  State<CreateDespesa> createState() => _CreateDespesaState();
}

class _CreateDespesaState extends State<CreateDespesa> {
  final _formKey = GlobalKey<FormState>();
  bool isPago = false;
  DateTime prazoData = DateTime.now();
  DateTime dataCriacao = DateTime.now();
  DateTime dataPagamento = DateTime.now();
  TextEditingController idController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  TextEditingController prazoController = TextEditingController();
  TextEditingController pagoController = TextEditingController();
  TextEditingController diaPagamentoController = TextEditingController();
  TextEditingController diaCriacaoController = TextEditingController();
  formatData(DateTime? pickedDate){
    if(pickedDate !=null) {
      return '${pickedDate.day < 10?"0${pickedDate.day}":pickedDate.day}/${pickedDate.month<10?"0${pickedDate.month}":pickedDate.month}/${pickedDate.year}';
    }
  }
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return isPago ? Colors.green : Colors.red;
  }

  Despesa criarDespesa() {
    return Despesa(
        id: idController.text,
        descricao: descricaoController.text,
        valor: double.parse(valorController.text),
        prazo: DateTime.now(),
        pago: isPago,
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
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(), //get today's date
                                firstDate: DateTime(
                                    2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));
                                prazoController.text = formatData(pickedDate);
                                prazoData = pickedDate!;
                          }),
                    ),
                    const SizedBox(width: 30.0),
                    Expanded(
                        child: Row(
                      children: [
                        const Text("Pago"),
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: isPago,
                          onChanged: (bool? value) {
                            setState(() {
                              isPago = value!;
                            });
                          },
                        ),
                      ],
                    )),
                  ],
                ),
                const SizedBox(height: 50.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Preco de dia p'),
                          controller: diaPagamentoController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "preencha o Preco de Custo";
                            }
                            return null;
                          },
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(), //get today's date
                                firstDate: DateTime(
                                    2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));
                                diaPagamentoController.text= formatData(pickedDate);
                                dataPagamento = pickedDate!;
                          }),
                    ),
                    const SizedBox(width: 30.0),
                    Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Preco de dia v'),
                          controller: diaCriacaoController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "preencha o Preco de  Venda";
                            }
                            return null;
                          },
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(), //get today's date
                                firstDate: DateTime(
                                    2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));
                                diaCriacaoController.text= formatData(pickedDate);
                                dataCriacao = pickedDate!;
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Despesa despesa = criarDespesa();
                            DespesaServices().salvarDespesa(despesa);
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
                            Despesa despesa = criarDespesa();
                            DespesaServices().salvarDespesa(despesa);
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
