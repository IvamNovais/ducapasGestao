import 'dart:convert';
import 'package:interno/controllers/AppController.dart';
import 'package:interno/models/Receita.dart';
import 'package:http/http.dart' as http;

class ReceitaServices {
  final String baseUrl = "http://localhost:9000"; // URL base da sua API

  Future<List<Receita>> obterTodasReceitas() async {
    final response = await http.get(
      Uri.parse('$baseUrl/receitas'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.instance.token}'
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> receitasJson = json.decode(response.body);
      return receitasJson
          .map((receitaJson) => Receita.fromJson(receitaJson))
          .toList();
    } else {
      throw Exception('Falha ao carregar receitas');
    }
  }

  Future<Receita> obterReceitaPorId(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/receitas/$id'));

    if (response.statusCode == 200) {
      final dynamic receitaJson = json.decode(response.body);
      return Receita.fromJson(receitaJson);
    } else {
      throw Exception('Falha ao carregar receita');
    }
  }

  Future<Receita> salvarReceita(Receita receita) async {
    final response = await http.post(
      Uri.parse('$baseUrl/receitas'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.instance.token}'
      },
      body: json.encode(receita.toJson()),
    );

    if (response.statusCode == 201) {
      final dynamic receitaJson = json.decode(response.body);
      return Receita.fromJson(receitaJson);
    } else {
      throw Exception('Falha ao salvar receita');
    }
  }

  Future<Receita> atualizarReceita(String id, Receita receita) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/receitas/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(receita.toJson()),
    );

    if (response.statusCode == 200) {
      final dynamic receitaJson = json.decode(response.body);
      return Receita.fromJson(receitaJson);
    } else {
      throw Exception('Falha ao atualizar receita');
    }
  }

  Future<void> deletarReceita(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/receitas/$id'));

    if (response.statusCode != 204) {
      throw Exception('Falha ao excluir receita');
    }
  }
}
