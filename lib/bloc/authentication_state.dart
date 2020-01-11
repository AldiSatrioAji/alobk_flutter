import 'package:alobk_app/core/role.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

class AuthenticationInitialState extends AuthenticationState {}
// class AuthenticationLoadingState extends AuthenticationState {}
class AuthenticationAuthState extends AuthenticationState {
  final RoleType roleType;

  AuthenticationAuthState(this.roleType);
}

class AuthenticationUnauthState extends AuthenticationState {}
