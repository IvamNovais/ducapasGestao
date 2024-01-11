class Receita {
  String id;
  String descricao;
  double valor;
  DateTime prazo;
  double juros;
  bool recebido;
  DateTime diaPagamento;
  DateTime diaCriacao;

  Receita({
    required this.id,
    required this.descricao,
    required this.valor,
    required this.juros,
    required this.prazo,
    required this.recebido,
    required this.diaPagamento,
    required this.diaCriacao,
  });
  factory Receita.fromJson(Map<String, dynamic> json) {
    return Receita(
      id: json['id'],
      descricao: json['descricao'],
      valor: json['valor'].toDouble(),
      juros: json['juros'].toDouble(),
      prazo: json['prazo'],
      recebido: json['recebido'].toDouble(),
      diaPagamento: json['diaPagamento'],
      diaCriacao: json['diaCriacao'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'juros': juros,
      'descricao': descricao,
      'valor': valor,
      'prazo': prazo,
      'recebido': recebido,
      'diaPagamento': diaPagamento,
      'diaCriacao': diaCriacao,
    };
  }
}