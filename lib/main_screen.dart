import 'package:alobk_app/src/bloc/authentication_state.dart';
import 'package:alobk_app/src/bloc/bloc.dart';
import 'package:alobk_app/src/presentation/home_screen.dart';
import 'package:alobk_app/src/presentation/login_screen.dart';
import 'package:alobk_app/src/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          if(state is AuthenticationInitialState) {
            return SplashScreen();
            //  return HomeScreen();
          }
          // if(state is AuthenticationLoadingState) {
          //   // Do Nothing
          //    return HomeScreen();
          // }
          if(state is AuthenticationAuthState) {
            return HomeScreen();
          }
          if(state is AuthenticationUnauthState) {
            return LoginScreen();
          }
        },
      )
    );
  }
}
