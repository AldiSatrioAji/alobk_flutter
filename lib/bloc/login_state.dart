import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginErrorState extends LoginState {}
