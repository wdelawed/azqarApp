import 'package:azkar/main_module/data/data_sources/local_datasource.dart';
import 'package:azkar/main_module/data/data_sources/remote_datasource.dart';
import 'package:azkar/main_module/data/repositories/prayer_timing_repository.dart';
import 'package:azkar/main_module/domain/usecases/get_prayer_timings.dart';
import 'package:azkar/main_module/presentation/bloc/prayertimings_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;
void init() {
  //register bloc
  locator.registerFactory(() => PrayertimingsBloc(getPrayerTimings: locator()));

  // usecase
  locator.registerLazySingleton(() => GetPrayerTimings(repo: locator()));

  // repository

  locator.registerLazySingleton(() => PrayerTimingsRepository(
      remoteDataSource: locator(), localDataSource: locator()));

  //data sources
  locator.registerLazySingleton(() => RemoteDataSource(client: locator()));
  locator.registerLazySingleton(() => LocalDataSource());

  //Http client
  locator.registerLazySingleton(() => http.Client());
}
