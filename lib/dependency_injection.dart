import 'package:azkar/main_module/data/data_sources/local_datasource.dart';
import 'package:azkar/main_module/data/data_sources/remote_datasource.dart';
import 'package:azkar/main_module/data/repositories/prayer_timing_repository.dart';
import 'package:azkar/main_module/domain/usecases/get_prayer_timings.dart';
import 'package:azkar/main_module/presentation/bloc/prayertimings_bloc.dart';
import 'package:azkar/zikr_collection_module/data/datasources/local_zikr_datasource.dart';
import 'package:azkar/zikr_collection_module/data/datasources/remote_zikr_datasource.dart';
import 'package:azkar/zikr_collection_module/data/repositories/zikr_collection_repository.dart';
import 'package:azkar/zikr_collection_module/domain/usecases/get_zikr_collection.dart';
import 'package:azkar/zikr_collection_module/representation/bloc/bloc/zikr_collection_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;
void init() {
  //register bloc
  locator.registerFactory(() => PrayertimingsBloc(getPrayerTimings: locator()));
  locator.registerFactory(() => ZikrCollectionBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetPrayerTimings(repo: locator()));
  locator.registerLazySingleton(
      () => GetZikrCollection(zikrCollectionRepository: locator()));

  // repository

  locator.registerLazySingleton(() => PrayerTimingsRepository(
      remoteDataSource: locator(), localDataSource: locator()));
  locator.registerLazySingleton(() => ZikrCollectionRepository(
      remoteZikrDataSource: locator(), localZikrDataSource: locator()));

  //data sources
  locator.registerLazySingleton(() => RemoteDataSource(client: locator()));
  locator.registerLazySingleton(() => LocalDataSource());

  locator.registerLazySingleton(() => LocalZikrDataSource());
  locator.registerLazySingleton(() => RemoteZikrDataSource(client: locator()));

  //Http client
  locator.registerLazySingleton(() => http.Client());
}
