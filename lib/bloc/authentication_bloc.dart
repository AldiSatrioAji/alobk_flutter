import 'dart:async';
import 'package:alobk_app/core/role.dart';
import 'package:alobk_app/domain/repository/login_repository.dart';
import 'package:alobk_app/ignore/static_data.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginRepository loginRepository;

  AuthenticationBloc({this.loginRepository});

  @override
  AuthenticationState get initialState => AuthenticationInitialState();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is LoggedIn) {
      yield AuthenticationAuthState(event.roleType);
    }
    if (event is LoggedOut) {
      yield AuthenticationUnauthState();
    }
    if (event is AppStarted) {
      final hasSession = await loginRepository.hasSession();
      if (hasSession) {
        yield AuthenticationAuthState(StaticData.currentRole);
      } else {
        yield AuthenticationUnauthState();
      }
    }
  }
}
