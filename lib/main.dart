import 'package:flutter/material.dart';
import 'package:interno/pages/Login.dart';
import 'package:interno/controllers/AppController.dart';
import 'package:interno/pages/CreateProduto.dart';

void main() {
  runApp(AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.blue, brightness: Brightness.light),
            home: const CreateProduto());
      }));
}
