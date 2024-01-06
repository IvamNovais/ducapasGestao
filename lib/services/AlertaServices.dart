import 'dart:convert';

import 'package:interno/controllers/AppController.dart';
import 'package:interno/models/Produto.dart';
import 'package:http/http.dart' as http;


class AlertaServices {
  final String baseUrl = "http://localhost:9000";
  Future<List<Produto>> getAlertasEstoque() async {
    final response = await http.get(
      Uri.parse('$baseUrl/alertas'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.instance.token}'
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> produtosJson = json.decode(response.body);
      return produtosJson
          .map((produtoJson) => Produto.fromJson(produtoJson))
          .toList();
    } else {
      throw Exception('Falha ao carregar produtos');
    }
  }
}