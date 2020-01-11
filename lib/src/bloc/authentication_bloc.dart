import 'dart:async';
import 'package:alobk_app/src/domain/repository/login_repository.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final LoginRepository loginRepository;

  AuthenticationBloc({this.loginRepository});

  @override
  AuthenticationState get initialState => AuthenticationInitialState();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if(event is LoggedIn) {
      yield AuthenticationAuthState();
    }
    if(event is LoggedOut) {
      // yield AuthenticationLoadingState();
      final clearSession = await loginRepository.clearSession();
      if(clearSession) {
        yield AuthenticationUnauthState();
      } else {
        yield AuthenticationAuthState();
      }
    }
    if(event is AppStarted) {
      final hasSession = await loginRepository.hasSession();
      if(hasSession) {
        yield AuthenticationAuthState();
      } else {
        yield AuthenticationUnauthState();
      }
    }
  }
}
