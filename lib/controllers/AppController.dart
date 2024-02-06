import 'package:flutter/material.dart';

class AppController extends ChangeNotifier{
  static AppController instance = AppController();
  bool isDarkThene = false;

  String token = '';
  changeTheme(){
    isDarkThene=!isDarkThene;
    notifyListeners();
  }
  saveToken(String token){
    this.token = token;
  }
}