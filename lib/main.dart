import 'package:alobk_app/main_screen.dart';
import 'package:alobk_app/src/bloc/bloc.dart';
import 'package:alobk_app/src/data/repository/login_repository.dart';
import 'package:alobk_app/src/network/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  // await init();
  // BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        primaryColor: Colors.blue,
        accentColor: Colors.deepOrange,
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(loginRepository: LoginRepositoryImpl(apiProvider: ApiProvider(httpClient: http.Client())))..add(AppStarted()),
        child: MainScreen(),
      )
    );
  }
}
