import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:poke_api/core/utils/constants/poke_constants.dart';
import 'package:poke_api/data/repository/poke_api_repository.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  final dio = Dio(
    BaseOptions(
      baseUrl: PokeConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ),
  );

  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<PokeApiRepository>(
      () => PokeApiRepository(dio: getIt()));
}
