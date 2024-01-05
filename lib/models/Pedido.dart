import 'package:interno/models/Produto.dart';

class Pedido{
  int quantidade;
  Produto produto;

  Pedido({
    required this.produto,
    required this.quantidade
  });
}