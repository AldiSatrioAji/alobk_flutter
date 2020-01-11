import 'package:alobk_app/core/role.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object> get props => null;
}

class AppStarted extends AuthenticationEvent {}
class LoggedIn extends AuthenticationEvent {
  final RoleType roleType;
  LoggedIn(this.roleType);
}
class LoggedOut extends AuthenticationEvent {}