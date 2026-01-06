import 'package:dio/dio.dart';
import 'package:enterprise/core/network/network_client.dart';
import 'package:enterprise/core/theme/bloc/theme_bloc.dart';
import 'package:enterprise/core/theme/data/repository/theme_repository_impl.dart';
import 'package:enterprise/core/theme/domain/repository/theme_repository.dart';
import 'package:enterprise/l10n/bloc/cubit/locale_cubit.dart';
import 'package:enterprise/l10n/data/locale_repository_impl.dart';
import 'package:enterprise/l10n/domain/locale_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  final secureStorage = FlutterSecureStorage(aOptions: getAndroidOptions());
  serviceLocator.registerLazySingleton<FlutterSecureStorage>(
    () => secureStorage,
  );

  //locale
  serviceLocator.registerLazySingleton<LocaleRepository>(()=>LocaleRepositoryImpl(sharedPreferences: serviceLocator()));
  serviceLocator.registerFactory<LocaleCubit>(()=>LocaleCubit(serviceLocator()));


  //theme
  serviceLocator.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(storage: serviceLocator()),
  );

  //Dio
  serviceLocator.registerLazySingleton(() => dio);

  //Network
  serviceLocator.registerLazySingleton(() => NetworkClient(dio: dio));
  //Use

  //Bloc
  serviceLocator.registerFactory(() => ThemeBloc(serviceLocator()));
}
