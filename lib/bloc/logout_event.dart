import 'package:equatable/equatable.dart';

abstract class LogoutEvent extends Equatable {
  const LogoutEvent();
  @override
  List<Object> get props => null;
}

class LogoutButtonPressed extends LogoutEvent {}
