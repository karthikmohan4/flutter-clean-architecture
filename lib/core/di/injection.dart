import 'package:dio/dio.dart';
import 'package:enterprise/core/network/network_client.dart';
import 'package:enterprise/core/theme/bloc/theme_bloc.dart';
import 'package:enterprise/core/theme/data/repository/theme_repository_impl.dart';
import 'package:enterprise/core/theme/domain/repository/theme_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  Dio dio = Dio();
  BaseOptions baseOptions = BaseOptions(
    receiveTimeout: Duration(seconds: 40),
    connectTimeout: Duration(seconds: 40),
    baseUrl: dotenv.env['BASE_URL'].toString(),
  );
  dio.options = baseOptions;

  // local/cache storage
  AndroidOptions getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
  final secureStorage = FlutterSecureStorage(aOptions: getAndroidOptions());
  serviceLocator.registerLazySingleton<FlutterSecureStorage>(
    () => secureStorage,
  );

  //theme
  serviceLocator.registerLazySingleton<ThemeRepository>(()=>ThemeRepositoryImpl(secureStorage: serviceLocator()));

  //Dio
  serviceLocator.registerLazySingleton(() => dio);

  //Network
  serviceLocator.registerLazySingleton(() => NetworkClient(dio: dio));
  //Use

  //Bloc
  serviceLocator.registerFactory(() => ThemeBloc(serviceLocator()));
}
