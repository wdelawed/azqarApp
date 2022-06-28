import 'package:either_dart/either.dart';

import '../../../main_module/data/failures.dart';
import '../../data/repositories/notifications_settings_module_repository_impl.dart';

class DisableZikrNotificationUseCase {
  DisableZikrNotificationUseCase({required this.repository});

  final NotificationsSettingsRepository repository;

  Future<Either<Failure, bool>> execute(int zikrId) async {
    return repository.disableNotification(zikrId);
  }
}
