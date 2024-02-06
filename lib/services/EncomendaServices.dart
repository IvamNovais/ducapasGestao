import 'dart:convert';
import 'package:interno/controllers/AppController.dart';
import 'package:interno/models/Encomenda.dart';
import 'package:http/http.dart' as http;

class EncomendaServices {
  final String baseUrl = "http://localhost:9000"; // URL base da sua API

  Future<List<Encomenda>> obterTodosEncomendas() async {
    final response = await http.get(
      Uri.parse('$baseUrl/encomendas'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.instance.token}'
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> encomendasJson = json.decode(response.body);
      return encomendasJson
          .map((encomendaJson) => Encomenda.fromJson(encomendaJson))
          .toList();
    } else {
      throw Exception('Falha ao carregar encomendas');
    }
  }

  Future<Encomenda> obterEncomendaPorId(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/encomendas/$id'));

    if (response.statusCode == 200) {
      final dynamic encomendaJson = json.decode(response.body);
      return Encomenda.fromJson(encomendaJson);
    } else {
      throw Exception('Falha ao carregar encomenda');
    }
  }

  Future<Encomenda> salvarEncomenda(Encomenda encomenda) async {
    final response = await http.post(
      Uri.parse('$baseUrl/encomendas'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.instance.token}'
      },
      body: json.encode(encomenda.toJson()),
    );

    if (response.statusCode == 201) {
      final dynamic encomendaJson = json.decode(response.body);
      return Encomenda.fromJson(encomendaJson);
    } else {
      throw Exception('Falha ao salvar encomenda');
    }
  }

  Future<Encomenda> atualizarEncomenda(String id, Encomenda encomenda) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/encomendas/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(encomenda.toJson()),
    );

    if (response.statusCode == 200) {
      final dynamic encomendaJson = json.decode(response.body);
      return Encomenda.fromJson(encomendaJson);
    } else {
      throw Exception('Falha ao atualizar encomenda');
    }
  }

  Future<void> deletarEncomenda(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/encomendas/$id'));

    if (response.statusCode != 204) {
      throw Exception('Falha ao excluir encomenda');
    }
  }
}
