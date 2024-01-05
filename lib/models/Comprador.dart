import 'package:interno/models/Endereco.dart';

class Comprador {
  String nomeRasaoSocial;
  String cpfCnpj;
  Endereco endereco;

  Comprador({
    required this.nomeRasaoSocial,
    required this.cpfCnpj,
    required this.endereco
  });
}