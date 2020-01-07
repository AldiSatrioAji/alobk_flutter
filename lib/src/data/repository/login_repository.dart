import 'dart:convert';
import 'dart:io';

import 'package:alobk_app/src/data/model/login_request.dart';
import 'package:alobk_app/src/domain/repository/login_repository.dart';
import 'package:alobk_app/src/network/api_provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepositoryImpl implements LoginRepository {

  final ApiProvider apiProvider;

  LoginRepositoryImpl({this.apiProvider});

  @override
  Future<bool> authenticate(String username, String password) async {
    final isSuccess = await apiProvider.authenticate(username, password);
    isSuccess ? saveProfilePreferences(username) : null;
    return isSuccess;
  }

  // Username sementara
  Future<void> saveProfilePreferences(String username) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("USERNAME", username);
    sharedPref.setBool("HAS_LOGGED", true);
  }

  @override
  Future<bool> hasSession() async {
    final sharedPref = await SharedPreferences.getInstance();
    final hasSession = sharedPref.getBool("HAS_LOGGED");
    return hasSession ?? false;
  }

  @override
  Future<bool> clearSession() async {
    final sharedPref = await SharedPreferences.getInstance();
    final clearSession = sharedPref.clear();
    return clearSession;
  }

}