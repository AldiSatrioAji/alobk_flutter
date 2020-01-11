import 'package:alobk_app/splash_screen.dart';
import 'package:alobk_app/student/src/presentation/login_screen.dart';
import 'package:alobk_app/student/src/presentation/student_screen.dart';
import 'package:alobk_app/teacher/src/presentation/teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'core/role.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {

      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          print("MainState is $state");
          if(state is AuthenticationInitialState) {
            return SplashScreen();
          }
          if(state is AuthenticationAuthState) {
            return StudentScreen();
            // return state.roleType == RoleType.SISWA ? StudentScreen() : TeacherScreen();
          }
          if(state is AuthenticationUnauthState) {
            return LoginScreen();
          }
        },
      )
    );
  }
}
