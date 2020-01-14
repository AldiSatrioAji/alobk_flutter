import 'dart:async';
import 'dart:io';
import 'package:alobk_app/core/role.dart';
import 'package:alobk_app/domain/repository/login_repository.dart';
import 'package:alobk_app/ignore/static_data.dart';
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
        isPassed ? authenticationBloc.add(LoggedIn(StaticData.currentRole)) : null;
        yield LoginInitialState();
      } catch (e) {
        yield LoginErrorState();
      }
    }
  }
}
