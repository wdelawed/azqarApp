import 'package:either_dart/either.dart';

import '../../../main_module/data/failures.dart';
import '../../data/repositories/notifications_settings_module_repository_impl.dart';

class EnableZikrNotificationUseCase {
  EnableZikrNotificationUseCase({required this.repository});

  final NotificationsSettingsRepository repository;

  Future<Either<Failure, bool>> execute(int zikrId, Duration duration,
      String periodArabic, String periodEnglish) async {
    return repository.enableNotification(
        zikrId, duration, periodArabic, periodEnglish);
  }
}
