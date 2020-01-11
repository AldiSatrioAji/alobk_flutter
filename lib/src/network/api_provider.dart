import 'dart:convert';

import 'package:alobk_app/src/data/model/login_request.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class ApiProvider {

  final http.Client httpClient;

  ApiProvider({@required this.httpClient});

  Future<bool> authenticate(String username, String password) async {

    final loginRequest = LoginRequest(
      username: username,
      password: password
    );

    try {
      final http = await httpClient.post("http://alobk.herokuapp.com/v1/api/login", body: loginRequest.toMap());
      return http.statusCode.responseStatusOk ? true : false;
    } catch (e) {
      throw Exception("Error");
    }
  }
}


extension ResponseExtension on int {
  bool get responseStatusOk {
    return this == 200;
  }
  bool get responseStatusFailure {
    return this == 201;
  }
  bool get responseStatusError {
    return this < 200 || this > 400;
  }
}