import 'package:alobk_app/core/dimens.dart';
import 'package:alobk_app/core/margin.dart';
import 'package:alobk_app/injection.dart';
import 'package:alobk_app/src/bloc/bloc.dart';
import 'package:alobk_app/src/bloc/login_bloc.dart';
import 'package:alobk_app/src/data/repository/login_repository.dart';
import 'package:alobk_app/src/domain/repository/login_repository.dart';
import 'package:alobk_app/src/network/api_provider.dart';
import 'package:alobk_app/src/presentation/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          loginRepository: LoginRepositoryImpl(apiProvider: ApiProvider(httpClient: http.Client())),
        ),
        child: LoginForm()
      ),
    );
  }
}
