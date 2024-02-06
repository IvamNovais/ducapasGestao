import 'package:interno/models/Produto.dart';


class PedidoEncomenda {
  String id;
  int quantidade;
  Produto produto;

  PedidoEncomenda({
    required this.id,
    required this.quantidade,
    required this.produto,
  });

  factory PedidoEncomenda.fromJson(Map<String, dynamic> json) {
    return PedidoEncomenda(
      id: json['id'],
      quantidade: json['quantidade'],
      produto: Produto.fromJson(json['produto']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantidade': quantidade,
      'produto': produto.toJson(),
    };
  }
}