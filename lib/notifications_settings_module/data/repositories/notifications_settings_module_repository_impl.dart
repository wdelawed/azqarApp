import 'package:azkar/main_module/data/exceptions.dart';
import 'package:azkar/main_module/data/failures.dart';
import 'package:azkar/notifications_settings_module/data/datasources/notifications_settings_module_remote_data_source.dart';
import 'package:azkar/notifications_settings_module/data/models/not_setting_item.dart';
import 'package:azkar/notifications_settings_module/domain/repositories/notifications_settings_module_repository.dart';
import 'package:either_dart/either.dart';

import '../datasources/notifications_settings_remote_dataSource.dart';

class NotificationsSettingsRepository
    extends AbstractNotificationsSettingsRepository {
  NotificationsSettingsLocalDataSource localDataSource;
  NotificationsSettingsRemoteDataSource remoteDataSource;
  NotificationsSettingsRepository(
      {required this.localDataSource, required this.remoteDataSource});

  @override
  Future<Either<Failure, bool>> disableNotification(int zikrId) async {
    try {
      await localDataSource.disableNotification(zikrId);
      return const Right(true);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> enableNotification(int zikrId,
      Duration duration, String periodArabic, String periodEnglish) async {
    try {
      await localDataSource.enableNotification(
          zikrId, duration, periodArabic, periodEnglish);
      return const Right(true);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NotSettingItem>>>
      getNotificationsSettings() async {
    try {
      final res = await remoteDataSource.getNotificationsSettings();
      for (var zikr in res) {
        localDataSource.createZikrIfNotExists(zikr);
      }
      return Right(res);
    } catch (e) {
      List<NotSettingItem> res = [];
      try {
        res = await localDataSource.getNotificationsSettings();

        return Right(res);
      } on LocalDBException {
        return Left(Failure(message: e.toString()));
      }
    }
  }
}
