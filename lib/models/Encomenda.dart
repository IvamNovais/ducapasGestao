
import 'package:interno/models/Comprador.dart';
import 'package:interno/models/Pedido.dart';

class Encomenda {
  Comprador comprador;
  DateTime data ;
  List<Pedido> pedidos;
  String status;

  Encomenda({
    required this.comprador,
    required this.data,
    required this.pedidos,
    required this.status
  });
}