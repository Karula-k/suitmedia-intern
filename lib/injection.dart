import 'package:get_it/get_it.dart';
import 'package:suitmedia_intern/features/data/datasources/remote_data_sources.dart';
import 'package:suitmedia_intern/features/data/helper/helper_palindrom.dart';
import 'package:suitmedia_intern/features/data/repositories/repository_impl.dart';
import 'package:suitmedia_intern/features/domain/repositories/palindrom_repositories.dart';
import 'package:suitmedia_intern/features/domain/usecase/check_palindrom.dart';
import 'package:suitmedia_intern/features/domain/usecase/get_list_user.dart';
import 'package:suitmedia_intern/features/domain/usecase/get_user.dart';
import 'package:suitmedia_intern/features/presentation/provider/palindrom_provider.dart';
import 'package:suitmedia_intern/features/presentation/provider/user_provider.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  //provider
  locator.registerFactory(() => PalindromProvider(checkPalindrom: locator()));
  locator.registerFactory(
      () => UserProvider(getUserDetail: locator(), getListUser: locator()));

  //usecase
  locator.registerLazySingleton(() => CheckPalindrom(locator()));
  locator.registerLazySingleton(() => GetUser(locator()));
  locator.registerLazySingleton(() => GetListUser(locator()));

  //repository
  locator.registerLazySingleton<PalindromRepository>(
      () => RepostioryIMPL(palindrom: locator(), remoteDataSource: locator()));

  //datasource
  locator.registerLazySingleton<PalindromFunction>(() => PalindromFunction());
  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: locator()));

  //external
  locator.registerLazySingleton(() => http.Client());
}
