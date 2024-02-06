import 'package:interno/models/Cliente.dart';
import 'package:interno/models/PedidoEncomenda.dart';

class Venda {
  String id;
  Cliente comprador;
  DateTime dataVenda;
  DateTime dataEntrega;
  List<PedidoEncomenda> pedidos;
  String status;

  Venda({
    required this.id,
    required this.comprador,
    required this.dataVenda,
    required this.dataEntrega,
    required this.pedidos,
    required this.status,
  });

  factory Venda.fromJson(Map<String, dynamic> json) {
    return Venda(
      id: json['id'],
      comprador: Cliente.fromJson(json['comprador']),
      dataVenda: DateTime.parse(json['dataVenda']),
      dataEntrega: DateTime.parse(json['dataEntrega']),
      pedidos: (json['pedidos'] as List)
          .map((pedido) => PedidoEncomenda.fromJson(pedido))
          .toList(),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'comprador': comprador.toJson(),
      'dataVenda': dataVenda.toIso8601String(),
      'dataEntrega': dataEntrega.toIso8601String(),
      'pedidos': pedidos.map((pedido) => pedido.toJson()).toList(),
      'status': status,
    };
  }
}
