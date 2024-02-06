import 'dart:convert';
import 'package:interno/controllers/AppController.dart';
import 'package:interno/models/Marca.dart';
import 'package:http/http.dart' as http;

class MarcaServices {
  final String baseUrl = "http://localhost:9000"; // URL base da sua API

  Future<List<Marca>> obterTodosMarcas() async {
    final response = await http.get(
      Uri.parse('$baseUrl/marcas'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.instance.token}'
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> marcasJson = json.decode(response.body);
      return marcasJson
          .map((marcaJson) => Marca.fromJson(marcaJson))
          .toList();
    } else {
      throw Exception('Falha ao carregar marcas');
    }
  }

  Future<Marca> obterMarcaPorId(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/marcas/$id'));

    if (response.statusCode == 200) {
      final dynamic marcaJson = json.decode(response.body);
      return Marca.fromJson(marcaJson);
    } else {
      throw Exception('Falha ao carregar marca');
    }
  }

  Future<Marca> salvarMarca(Marca marca) async {
    final response = await http.post(
      Uri.parse('$baseUrl/marcas'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.instance.token}'
      },
      body: json.encode(marca.toJson()),
    );

    if (response.statusCode == 201) {
      final dynamic marcaJson = json.decode(response.body);
      return Marca.fromJson(marcaJson);
    } else {
      throw Exception('Falha ao salvar marca');
    }
  }

  Future<Marca> atualizarMarca(String id, Marca marca) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/marcas/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(marca.toJson()),
    );

    if (response.statusCode == 200) {
      final dynamic marcaJson = json.decode(response.body);
      return Marca.fromJson(marcaJson);
    } else {
      throw Exception('Falha ao atualizar marca');
    }
  }

  Future<void> deletarMarca(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/marcas/$id'));

    if (response.statusCode != 204) {
      throw Exception('Falha ao excluir marca');
    }
  }
}
