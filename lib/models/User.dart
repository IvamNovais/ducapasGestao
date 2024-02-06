
class User {
  String id;
  String nome;
  String login;
  String password;
  String role;

  User({
    required this.id,
    required this.nome,
    required this.login,
    required this.password,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nome: json['nome'],
      login: json['login'],
      password: json['password'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'login': login,
      'password': password,
      'role': role,
    };
  }
}