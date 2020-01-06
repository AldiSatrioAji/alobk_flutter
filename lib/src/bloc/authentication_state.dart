import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

class AuthenticationInitialState extends AuthenticationState {}
// class AuthenticationLoadingState extends AuthenticationState {}
class AuthenticationAuthState extends AuthenticationState {}
class AuthenticationUnauthState extends AuthenticationState {}
