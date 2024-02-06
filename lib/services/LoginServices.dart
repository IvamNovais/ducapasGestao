import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interno/App.dart';
import 'package:interno/HomePage.dart';
import 'package:interno/controllers/AppController.dart';
import 'package:interno/models/Login.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  final String baseUrl = "http://localhost:9000";
  logar(LoginModel login, BuildContext context) async {
    final response = await http.post(Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(login.toJson()));
    if (response.statusCode == 200) {
      registraLogin(context, json.decode(response.body)['token']);
    } else {
      throw Exception('Falha ao Logar');
    }
  }

  registraLogin(BuildContext context, String token) {
    AppController.instance.saveToken(token);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}
