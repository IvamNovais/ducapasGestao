import 'dart:convert';
import 'package:interno/controllers/AppController.dart';
import 'package:interno/models/Endereco.dart';
import 'package:http/http.dart' as http;

class EnderecoServices {
  final String baseUrl = "http://localhost:9000"; // URL base da sua API

  Future<List<Endereco>> obterTodasEnderecos() async {
    final response = await http.get(
      Uri.parse('$baseUrl/enderecos'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.instance.token}'
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> enderecosJson = json.decode(response.body);
      return enderecosJson
          .map((enderecoJson) => Endereco.fromJson(enderecoJson))
          .toList();
    } else {
      throw Exception('Falha ao carregar enderecos');
    }
  }

  Future<Endereco> obterEnderecoPorId(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/enderecos/$id'));

    if (response.statusCode == 200) {
      final dynamic enderecoJson = json.decode(response.body);
      return Endereco.fromJson(enderecoJson);
    } else {
      throw Exception('Falha ao carregar endereco');
    }
  }

  Future<Endereco> salvarEndereco(Endereco endereco) async {
    final response = await http.post(
      Uri.parse('$baseUrl/enderecos'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.instance.token}'
      },
      body: json.encode(endereco.toJson()),
    );

    if (response.statusCode == 201) {
      final dynamic enderecoJson = json.decode(response.body);
      return Endereco.fromJson(enderecoJson);
    } else {
      throw Exception('Falha ao salvar endereco');
    }
  }

  Future<Endereco> atualizarEndereco(String id, Endereco endereco) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/enderecos/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(endereco.toJson()),
    );

    if (response.statusCode == 200) {
      final dynamic enderecoJson = json.decode(response.body);
      return Endereco.fromJson(enderecoJson);
    } else {
      throw Exception('Falha ao atualizar endereco');
    }
  }

  Future<void> deletarEndereco(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/enderecos/$id'));

    if (response.statusCode != 204) {
      throw Exception('Falha ao excluir endereco');
    }
  }
}
