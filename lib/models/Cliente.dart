import 'package:interno/models/Endereco.dart';
import 'package:interno/models/User.dart';

class Cliente {
  String id;
  User user;
  String nomeRazaoSocial;
  String cpfCnpj;
  Endereco endereco;

  Cliente({
    required this.id,
    required this.user,
    required this.nomeRazaoSocial,
    required this.cpfCnpj,
    required this.endereco,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      user: User.fromJson(json['user']),
      nomeRazaoSocial: json['nomeRazaoSocial'],
      cpfCnpj: json['cpfCnpj'],
      endereco: Endereco.fromJson(json['endereco']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'nomeRazaoSocial': nomeRazaoSocial,
      'cpfCnpj': cpfCnpj,
      'endereco': endereco.toJson(),
    };
  }
}