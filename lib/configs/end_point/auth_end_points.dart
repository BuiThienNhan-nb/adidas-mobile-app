class AuthEndPoint {
  static const register = "auth/register";
  static const login = "auth/login";
  static checkEmail(String id) => "auth/checkEmail/$id";
}
