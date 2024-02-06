import 'package:interno/models/Produto.dart';

class Marca {
  String id;
  String nome;
  List<Produto> produtos;

  Marca({
    required this.id,
    required this.nome,
    required this.produtos,
  });

  factory Marca.fromJson(Map<String, dynamic> json) {
    return Marca(
      id: json['id'],
      nome: json['nome'],
      produtos: json['produtos']!=null? (json['produtos'] as List)
          .map((produto) => Produto.fromJson(produto))
          .toList():[],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'produtos': produtos.map((produto) => produto.toJson()).toList(),
    };
  }
}