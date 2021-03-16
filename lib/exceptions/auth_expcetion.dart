class AuthException implements Exception {
  final String key;
  static const Map<String, String> erros = {
    "EMAIL_EXISTS": "E-mail já existe no banco de dados!",
    "OPERATION_NOT_ALLOWED": "Operação não permitida!",
    "TOO_MANY_ATTEMPTS_TRY_LATER": "Tente mais tarde!",
    "EMAIL_NOT_FOUND": "E-mail não encontrado.",
    "INVALID_PASSWORD": "Senha inválida.",
    "USER_DISABLE": "Usuário está inativo.",
  };

  AuthException(this.key);

  @override
  String toString() {
    if (erros.containsKey(key)) {
      return erros[key];
    } else {
      return "Ocorre um erro na autenticação.";
    }
  }
}
