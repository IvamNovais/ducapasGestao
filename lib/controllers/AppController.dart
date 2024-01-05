import 'package:flutter/material.dart';

class AppController extends ChangeNotifier{
  static AppController instance = AppController();
  bool isDarkThene = false;
  List<Widget> inputFields = [];
  List<TextEditingController> textEditingControllersMercadoria = [];
  List<TextEditingController> textEditingControllersQuatidade = [];
  addInput() {
    TextEditingController mercadoria = TextEditingController();
    TextEditingController quantidade = TextEditingController();
    textEditingControllersMercadoria.add(mercadoria);
    textEditingControllersQuatidade.add(quantidade);
    inputFields.add(
      Row(
        children: [
          SizedBox(
            width: 250,
            child: Expanded(
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Mercadoria'),
                validator: (value)  {
                    if(value == null|| value.isEmpty){
                      return "preencha a MSrcadoria";
                    }
                    return null;
                  },
                controller: mercadoria,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          SizedBox(
            width: 50,
            child: Expanded(
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Quantidade'),
                validator: (value)  {
                    if(value == null|| value.isEmpty){
                      return "preencha a Quantidade";
                    }
                    return null;
                  },
                controller: quantidade,
              ),
            ),
          ),
        ],
      ),
    );
  }
  changeTheme(){
    isDarkThene=!isDarkThene;
    notifyListeners();
  }
}