import 'dart:async';
import 'dart:io';
import 'package:alobk_app/src/domain/repository/login_repository.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginRepository loginRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({this.loginRepository, this.authenticationBloc});

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if(event is LoginButtonPressed) {
      yield LoginLoadingState();
      try {
        final isPassed = await loginRepository.authenticate(event.username, event.password);
        isPassed ? authenticationBloc.add(LoggedIn()) : null;
        yield LoginInitialState();
      } on HttpException {
        yield LoginErrorState();
      }
    }
  }
}
