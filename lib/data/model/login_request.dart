
class LoginRequest {
  final String username;
  final String password;

  LoginRequest({this.username, this.password});

  factory LoginRequest.fromJson(Map<String, String>fromJson) {
    return LoginRequest(
      username: fromJson['username'],
      password: fromJson['password']
    );
  }

  Map toMap() {
    var map = Map<String, dynamic>();
    map['username'] = username;
    map['password'] = password;
    return map;
  }

}