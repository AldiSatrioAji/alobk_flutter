import 'package:equatable/equatable.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();
  @override
  List<Object> get props => [];
}

class LogoutInitialState extends LogoutState {}
class LogoutLoadingState extends LogoutState {}
