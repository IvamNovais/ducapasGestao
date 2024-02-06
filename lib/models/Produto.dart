
import 'package:interno/models/Marca.dart';

class Produto {
  String id;
  String descricao;
  String categoria;
  double precoCusto;
  double precoVenda;
  int quantidadeEstoque;
  int quantidadeEstoqueMinima;
  Marca marca;

  Produto({
    required this.id,
    required this.descricao,
    required this.categoria,
    required this.precoCusto,
    required this.precoVenda,
    required this.quantidadeEstoque,
    required this.quantidadeEstoqueMinima,
    required this.marca
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'],
      descricao: json['descricao'],
      categoria: json['categoria'],
      precoCusto: json['precoCusto'].toDouble(),
      precoVenda: json['precoVenda'].toDouble(),
      quantidadeEstoque: json['quantidadeEstoque'],
      quantidadeEstoqueMinima: json['quantidadeEstoqueMinima'],
      marca: json['marca'] != null ? Marca.fromJson(json['marca']):Marca(id: "", nome: "", produtos: [])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descricao': descricao,
      'categoria': categoria,
      'precoCusto': precoCusto,
      'precoVenda': precoVenda,
      'quantidadeEstoque': quantidadeEstoque,
      'quantidadeEstoqueMinima': quantidadeEstoqueMinima,
      'marca': marca.toJson(),
    };
  }
}