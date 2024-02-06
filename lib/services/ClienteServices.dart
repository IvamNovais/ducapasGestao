import 'dart:convert';
import 'package:interno/controllers/AppController.dart';
import 'package:interno/models/Cliente.dart';
import 'package:http/http.dart' as http;

class ClienteServices {
  final String baseUrl = "http://localhost:9000"; // URL base da sua API

  Future<List<Cliente>> obterTodosClientes() async {
    final response = await http.get(
      Uri.parse('$baseUrl/clientes'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.instance.token}'
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> clientesJson = json.decode(response.body);
      return clientesJson
          .map((clienteJson) => Cliente.fromJson(clienteJson))
          .toList();
    } else {
      throw Exception('Falha ao carregar clientes');
    }
  }

  Future<Cliente> obterClientePorId(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/clientes/$id'));

    if (response.statusCode == 200) {
      final dynamic clienteJson = json.decode(response.body);
      return Cliente.fromJson(clienteJson);
    } else {
      throw Exception('Falha ao carregar cliente');
    }
  }

  Future<Cliente> salvarCliente(Cliente cliente) async {
    final response = await http.post(
      Uri.parse('$baseUrl/clientes'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.instance.token}'
      },
      body: json.encode(cliente.toJson()),
    );

    if (response.statusCode == 201) {
      final dynamic clienteJson = json.decode(response.body);
      return Cliente.fromJson(clienteJson);
    } else {
      throw Exception('Falha ao salvar cliente');
    }
  }

  Future<Cliente> atualizarCliente(String id, Cliente cliente) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/clientes/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(cliente.toJson()),
    );

    if (response.statusCode == 200) {
      final dynamic clienteJson = json.decode(response.body);
      return Cliente.fromJson(clienteJson);
    } else {
      throw Exception('Falha ao atualizar cliente');
    }
  }

  Future<void> deletarCliente(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/clientes/$id'));

    if (response.statusCode != 204) {
      throw Exception('Falha ao excluir cliente');
    }
  }
}
