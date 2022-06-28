import 'package:azkar/main_module/data/failures.dart';
import 'package:azkar/notifications_settings_module/data/models/not_setting_item.dart';
import 'package:azkar/notifications_settings_module/data/repositories/notifications_settings_module_repository_impl.dart';
import 'package:either_dart/either.dart';

class FetchNotificationsSettingsUseCase {
  FetchNotificationsSettingsUseCase({required this.repository});

  final NotificationsSettingsRepository repository;

  Future<Either<Failure, List<NotSettingItem>>> execute() async {
    return repository.getNotificationsSettings();
  }
}
