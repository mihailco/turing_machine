class Urls {
  
  static const _http = "http://";
  static const localhost = "192.168.0.10:8000";
  static const signIn = "$_http$localhost/auth/sign-in";
  static const signUp = "$_http$localhost/auth/sign-up";

  static const ws = "ws://$localhost/api/messages";
}
