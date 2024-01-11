class Despesa {
  String id;
  String descricao;
  double valor;
  DateTime prazo;
  bool pago;
  DateTime diaPagamento;
  DateTime diaCriacao;

  Despesa({
    required this.id,
    required this.descricao,
    required this.valor,
    required this.prazo,
    required this.pago,
    required this.diaPagamento,
    required this.diaCriacao,
  });
  factory Despesa.fromJson(Map<String, dynamic> json) {
    return Despesa(
      id: json['id'],
      descricao: json['descricao'],
      valor: json['valor'].toDouble(),
      prazo: json['prazo'],
      pago: json['pago'].toDouble(),
      diaPagamento: json['diaPagamento'],
      diaCriacao: json['diaCriacao'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descricao': descricao,
      'valor': valor,
      'prazo': prazo,
      'pago': pago,
      'diaPagamento': diaPagamento,
      'diaCriacao': diaCriacao,
    };
  }
}