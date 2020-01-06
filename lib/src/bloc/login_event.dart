import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  
  final String username;
  final String password;

  LoginButtonPressed({this.username, this.password});

  @override
  List<Object> get props => [username, password];

}