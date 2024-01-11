import 'dart:convert';
import 'package:interno/controllers/AppController.dart';
import 'package:interno/models/Despesa.dart';
import 'package:http/http.dart' as http;

class DespesaServices {
  final String baseUrl = "http://localhost:9000"; // URL base da sua API

  Future<List<Despesa>> obterTodasDespesas() async {
    final response = await http.get(
      Uri.parse('$baseUrl/despesas'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.instance.token}'
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> despesasJson = json.decode(response.body);
      return despesasJson
          .map((despesaJson) => Despesa.fromJson(despesaJson))
          .toList();
    } else {
      throw Exception('Falha ao carregar despesas');
    }
  }

  Future<Despesa> obterDespesaPorId(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/despesas/$id'));

    if (response.statusCode == 200) {
      final dynamic despesaJson = json.decode(response.body);
      return Despesa.fromJson(despesaJson);
    } else {
      throw Exception('Falha ao carregar despesa');
    }
  }

  Future<Despesa> salvarDespesa(Despesa despesa) async {
    final response = await http.post(
      Uri.parse('$baseUrl/despesas'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.instance.token}'
      },
      body: json.encode(despesa.toJson()),
    );

    if (response.statusCode == 201) {
      final dynamic despesaJson = json.decode(response.body);
      return Despesa.fromJson(despesaJson);
    } else {
      throw Exception('Falha ao salvar despesa');
    }
  }

  Future<Despesa> atualizarDespesa(String id, Despesa despesa) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/despesas/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(despesa.toJson()),
    );

    if (response.statusCode == 200) {
      final dynamic despesaJson = json.decode(response.body);
      return Despesa.fromJson(despesaJson);
    } else {
      throw Exception('Falha ao atualizar despesa');
    }
  }

  Future<void> deletarDespesa(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/despesas/$id'));

    if (response.statusCode != 204) {
      throw Exception('Falha ao excluir despesa');
    }
  }
}
