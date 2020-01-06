
import 'package:alobk_app/src/bloc/authentication_bloc.dart';
import 'package:alobk_app/src/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/data/repository/login_repository.dart';
import 'src/domain/repository/login_repository.dart';
import 'src/network/api_provider.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {

  // BloC
  sl.registerFactory(
    () => AuthenticationBloc(
      loginRepository: sl<LoginRepository>()
    ),
  );
  sl.registerFactory(
    () => LoginBloc(
      authenticationBloc: sl(),
      loginRepository: sl(),
    ),
  );

  sl.registerFactory(() => http.Client());

  // Repository
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(apiProvider: sl()));
  sl.registerLazySingleton(() => ApiProvider(httpClient: sl()));

  // Shared Preferences
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPref);
}