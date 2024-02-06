import 'dart:convert';
import 'package:interno/controllers/AppController.dart';
import 'package:interno/models/User.dart';
import 'package:http/http.dart' as http;

class UserServices {
  final String baseUrl = "http://localhost:9000"; // URL base da sua API

  Future<List<User>> obterTodasUsers() async {
    final response = await http.get(
      Uri.parse('$baseUrl/users'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.instance.token}'
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> usersJson = json.decode(response.body);
      return usersJson
          .map((userJson) => User.fromJson(userJson))
          .toList();
    } else {
      throw Exception('Falha ao carregar users');
    }
  }

  Future<User> obterUserPorId(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$id'));

    if (response.statusCode == 200) {
      final dynamic userJson = json.decode(response.body);
      return User.fromJson(userJson);
    } else {
      throw Exception('Falha ao carregar user');
    }
  }

  Future<User> salvarUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.instance.token}'
      },
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 201) {
      final dynamic userJson = json.decode(response.body);
      return User.fromJson(userJson);
    } else {
      throw Exception('Falha ao salvar user');
    }
  }

  Future<User> atualizarUser(String id, User user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/users/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 200) {
      final dynamic userJson = json.decode(response.body);
      return User.fromJson(userJson);
    } else {
      throw Exception('Falha ao atualizar user');
    }
  }

  Future<void> deletarUser(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/users/$id'));

    if (response.statusCode != 204) {
      throw Exception('Falha ao excluir user');
    }
  }
}
