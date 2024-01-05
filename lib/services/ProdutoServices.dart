import 'dart:convert';
import 'package:interno/models/Produto.dart';
import 'package:http/http.dart' as http;

class ProdutoService {
  final String baseUrl = "http://localhost:9000"; // URL base da sua API


  Future<List<Produto>> obterTodosProdutos() async {
    final response = await http.get(Uri.parse('$baseUrl/produtos'));

    if (response.statusCode == 200) {
      final List<dynamic> produtosJson = json.decode(response.body);
      return produtosJson.map((produtoJson) => Produto.fromJson(produtoJson)).toList();
    } else {
      throw Exception('Falha ao carregar produtos');
    }
  }

  Future<Produto> obterProdutoPorId(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/produtos/$id'));

    if (response.statusCode == 200) {
      final dynamic produtoJson = json.decode(response.body);
      return Produto.fromJson(produtoJson);
    } else {
      throw Exception('Falha ao carregar produto');
    }
  }

  Future<Produto> salvarProduto(Produto produto) async {
    final response = await http.post(
      Uri.parse('$baseUrl/produtos'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(produto.toJson()),
    );

    if (response.statusCode == 201) {
      final dynamic produtoJson = json.decode(response.body);
      return Produto.fromJson(produtoJson);
    } else {
      throw Exception('Falha ao salvar produto');
    }
  }

  Future<Produto> atualizarProduto(String id, Produto produto) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/produtos/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(produto.toJson()),
    );

    if (response.statusCode == 200) {
      final dynamic produtoJson = json.decode(response.body);
      return Produto.fromJson(produtoJson);
    } else {
      throw Exception('Falha ao atualizar produto');
    }
  }

  Future<void> deletarProduto(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/produtos/$id'));

    if (response.statusCode != 204) {
      throw Exception('Falha ao excluir produto');
    }
  }
}
