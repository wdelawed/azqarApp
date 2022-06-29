import 'package:azkar/main_module/data/failures.dart';
import 'package:either_dart/either.dart';

import '../../data/models/not_setting_item.dart';

abstract class AbstractNotificationsSettingsRepository {
  Future<Either<Failure, List<NotSettingItem>>> getNotificationsSettings();

  Future<Either<Failure, bool>> enableNotification(
      int zikrId, Duration duration, String periodArabic, String periodEnglish);
  Future<Either<Failure, void>> disableNotification(int zikrId);

  // Future<Either<Failure, void>> createZikrIfNotExists(NotSettingItem zikr);
}
