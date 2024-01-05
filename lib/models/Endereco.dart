class Endereco {
  String rua;
  String numero;
  String bairo;
  String cidade;

  Endereco({
    required this.rua,
    required this.bairo,
    required this.cidade,
    required this.numero
  });
  @override
  String toString() {
    // TODO: implement toString
    return "$rua $numero $bairo $cidade";
  }
}