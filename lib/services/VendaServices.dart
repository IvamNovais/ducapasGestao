import 'dart:convert';
import 'package:interno/controllers/AppController.dart';
import 'package:interno/models/Venda.dart';
import 'package:http/http.dart' as http;

class VendasServices {
  final String baseUrl = "http://localhost:9000"; // URL base da sua API

  Future<List<Venda>> obterTodosVendas() async {
    final response = await http.get(
      Uri.parse('$baseUrl/vendass'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.instance.token}'
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> vendassJson = json.decode(response.body);
      return vendassJson
          .map((vendasJson) => Venda.fromJson(vendasJson))
          .toList();
    } else {
      throw Exception('Falha ao carregar vendass');
    }
  }

  Future<Venda> obterVendasPorId(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/vendass/$id'));

    if (response.statusCode == 200) {
      final dynamic vendasJson = json.decode(response.body);
      return Venda.fromJson(vendasJson);
    } else {
      throw Exception('Falha ao carregar vendas');
    }
  }

  Future<Venda> salvarVendas(Venda vendas) async {
    final response = await http.post(
      Uri.parse('$baseUrl/vendass'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.instance.token}'
      },
      body: json.encode(vendas.toJson()),
    );

    if (response.statusCode == 201) {
      final dynamic vendasJson = json.decode(response.body);
      return Venda.fromJson(vendasJson);
    } else {
      throw Exception('Falha ao salvar vendas');
    }
  }

  Future<Venda> atualizarVendas(String id, Venda vendas) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/vendass/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(vendas.toJson()),
    );

    if (response.statusCode == 200) {
      final dynamic vendasJson = json.decode(response.body);
      return Venda.fromJson(vendasJson);
    } else {
      throw Exception('Falha ao atualizar vendas');
    }
  }

  Future<void> deletarVendas(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/vendass/$id'));

    if (response.statusCode != 204) {
      throw Exception('Falha ao excluir vendas');
    }
  }
}
