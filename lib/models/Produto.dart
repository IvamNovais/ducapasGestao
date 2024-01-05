
class Produto {
  final String id;
  final String descricao;
  final String categoria;
  final double precoCusto;
  final double precoVenda;
  final int quantidadeEstoque;
  final int quantidadeEstoqueMinima;

  Produto({
    required this.id,
    required this.descricao,
    required this.categoria,
    required this.precoCusto,
    required this.precoVenda,
    required this.quantidadeEstoque,
    required this.quantidadeEstoqueMinima,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'],
      descricao: json['descricao'],
      categoria: json['categoria'],
      precoCusto: json['precoCusto'].toDouble(),
      precoVenda: json['precoVenda'].toDouble(),
      quantidadeEstoque: json['quantidadeEstoque'],
      quantidadeEstoqueMinima: json['quantidadeEstoqueMinima'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descricao': descricao,
      'categoria': categoria,
      'precoCusto': precoCusto,
      'precoVenda': precoVenda,
      'quantidadeEstoque': quantidadeEstoque,
      'quantidadeEstoqueMinima': quantidadeEstoqueMinima,
    };
  }
}