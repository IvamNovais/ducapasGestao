class LoginModel {
  String login;
  String password;

  LoginModel({
    required this.login,
    required this.password
  });

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'password': password,
    };
  }
}

