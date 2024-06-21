import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../features/home/data/repo/home_repo.dart';
import '../features/home/logic/cubit/home_cubit.dart';
import 'networking/api_service.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  getIt
      .registerLazySingleton<ApiService>(() => ApiService(createAndSetupDio()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = const Duration(seconds: 10)
    ..options.receiveTimeout = const Duration(seconds: 20);

  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    error: true,
    requestHeader: true,
    responseHeader: true,
    request: true,
    responseBody: true,
  ));
  return dio;
}
