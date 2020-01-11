import 'package:alobk_app/core/routes.dart';
import 'package:alobk_app/injection.dart';
import 'package:alobk_app/main_screen.dart';
import 'package:alobk_app/student/src/presentation/bacaan_screen.dart';
import 'package:alobk_app/student/src/presentation/daring_screen.dart';
import 'package:alobk_app/student/src/presentation/konselor_screen.dart';
import 'package:alobk_app/student/src/presentation/konselor_screen/detail_konselor_screen.dart';
import 'package:alobk_app/student/src/presentation/login_screen.dart';
import 'package:alobk_app/student/src/presentation/pengaturan_screen.dart';
import 'package:alobk_app/student/src/presentation/profile_screen.dart';
import 'package:alobk_app/student/src/presentation/tatap_muka_screen.dart';
import 'package:alobk_app/student/src/presentation/tulis_diari_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'bloc/authentication_bloc.dart';
import 'bloc/authentication_event.dart';

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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
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
        create: (context) => sl<AuthenticationBloc>()..add(AppStarted()),
        child: MainScreen(),
      ),
      routes: <String, WidgetBuilder> {
        Routes.login: (BuildContext context) => LoginScreen(),
        Routes.konselor: (BuildContext context) => KonselorScreen(),
        Routes.detailKonselor: (BuildContext context) => DetailKonselorScreen(),
        Routes.tatapMuka: (BuildContext context) => TatapMukaScreen(),
        Routes.daring: (BuildContext context) => DaringScreen(),
        Routes.tulisDiari: (BuildContext context) => TulisDiariScreen(),
        Routes.bacaan: (BuildContext context) => BacaanScreen(),
        Routes.pengaturan: (BuildContext context) => PengaturanScreen(),
        Routes.profileStudent: (BuildContext context) => ProfileScreen(),
      },
    );
  }
}
