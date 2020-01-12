import 'dart:async';
import 'package:alobk_app/domain/repository/login_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {

  final LoginRepository loginRepository;
  final AuthenticationBloc authenticationBloc;

  LogoutBloc({this.loginRepository, this.authenticationBloc});

  @override
  LogoutState get initialState => LogoutInitialState();

  @override
  Stream<LogoutState> mapEventToState(
    LogoutEvent event,
  ) async* {
    if(event is LogoutButtonPressed) {
      yield LogoutLoadingState();
      authenticationBloc.add(LoggedOut());
      yield LogoutInitialState();
      // final isClearSessionSuccess = await loginRepository.clearSession();
      // isClearSessionSuccess ? authenticationBloc.add(LoggedOut()) : LogoutInitialState();
    }
  }
}
