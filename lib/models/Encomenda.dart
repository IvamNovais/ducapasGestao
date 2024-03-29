import 'package:interno/models/Cliente.dart';
import 'package:interno/models/PedidoEncomenda.dart';

class Encomenda {
  String id;
  Cliente comprador;
  DateTime dataEncomenda;
  DateTime dataEntrega;
  List<PedidoEncomenda> pedidos;
  String status;

  Encomenda({
    required this.id,
    required this.comprador,
    required this.dataEncomenda,
    required this.dataEntrega,
    required this.pedidos,
    required this.status,
  });

  factory Encomenda.fromJson(Map<String, dynamic> json) {
    return Encomenda(
      id: json['id'],
      comprador: Cliente.fromJson(json['comprador']),
      dataEncomenda: DateTime.parse(json['dataEncomenda']),
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
      'dataEncomenda': dataEncomenda.toIso8601String(),
      'dataEntrega': dataEntrega.toIso8601String(),
      'pedidos': pedidos.map((pedido) => pedido.toJson()).toList(),
      'status': status,
    };
  }
}
