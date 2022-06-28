import 'package:azkar/main_module/data/data_sources/local_datasource.dart';
import 'package:azkar/main_module/data/data_sources/remote_datasource.dart';
import 'package:azkar/main_module/data/repositories/prayer_timing_repository.dart';
import 'package:azkar/main_module/domain/usecases/get_prayer_timings.dart';
import 'package:azkar/main_module/presentation/bloc/prayertimings_bloc.dart';
import 'package:azkar/notifications_settings_module/data/database/noti_settings_db_provider.dart';
import 'package:azkar/notifications_settings_module/data/datasources/notifications_settings_module_remote_data_source.dart';
import 'package:azkar/notifications_settings_module/data/datasources/notifications_settings_remote_dataSource.dart';
import 'package:azkar/notifications_settings_module/data/repositories/notifications_settings_module_repository_impl.dart';
import 'package:azkar/notifications_settings_module/domain/usecases/disable_zikr_notification_setting_usecase.dart';
import 'package:azkar/notifications_settings_module/domain/usecases/enable_zikr_notification_setting_usecase.dart';
import 'package:azkar/notifications_settings_module/domain/usecases/fetch_notifications_settings_module_usecase.dart';
import 'package:azkar/notifications_settings_module/presentation/blocs/azkar_notifications_settings_bloc.dart';
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
  locator.registerFactory(() => AzkarNotificationsSettingsBloc(
      fetchNotificationsSettings: locator(),
      enableZikrNotification: locator(),
      disableZikrNotification: locator()));

  // usecases
  locator.registerLazySingleton(() => GetPrayerTimings(repo: locator()));
  locator.registerLazySingleton(
      () => GetZikrCollection(zikrCollectionRepository: locator()));
  locator.registerLazySingleton(
      () => FetchNotificationsSettingsUseCase(repository: locator()));
  locator.registerLazySingleton(
      () => EnableZikrNotificationUseCase(repository: locator()));
  locator.registerLazySingleton(
      () => DisableZikrNotificationUseCase(repository: locator()));

  // repositories

  locator.registerLazySingleton(() => PrayerTimingsRepository(
      remoteDataSource: locator(), localDataSource: locator()));
  locator.registerLazySingleton(() => ZikrCollectionRepository(
      remoteZikrDataSource: locator(), localZikrDataSource: locator()));
  locator.registerLazySingleton(() => NotificationsSettingsRepository(
      localDataSource: locator(), remoteDataSource: locator()));

  //data sources
  locator.registerLazySingleton(() => RemoteDataSource(client: locator()));
  locator.registerLazySingleton(() => LocalDataSource());
  locator.registerLazySingleton(
      () => NotificationsSettingsLocalDataSource(dbProvider: locator()));
  locator.registerLazySingleton(
      () => NotificationsSettingsRemoteDataSource(client: locator()));

  locator.registerLazySingleton(() => LocalZikrDataSource());
  locator.registerLazySingleton(() => RemoteZikrDataSource(client: locator()));
  locator.registerLazySingleton(() => NotificationsSettingsDBProvider());

  //Http client
  locator.registerLazySingleton(() => http.Client());
}
