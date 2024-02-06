
class Endereco {
  String id;
  String rua;
  String numero;
  String bairro;
  String cidade;

  Endereco({
    required this.id,
    required this.rua,
    required this.numero,
    required this.bairro,
    required this.cidade,
  });

  factory Endereco.fromJson(Map<String, dynamic> json) {
    return Endereco(
      id: json['id'],
      rua: json['rua'],
      numero: json['numero'],
      bairro: json['bairro'],
      cidade: json['cidade'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rua': rua,
      'numero': numero,
      'bairro': bairro,
      'cidade': cidade,
    };
  }
}
