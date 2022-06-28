import 'package:azkar/main_module/data/exceptions.dart';
import 'package:azkar/notifications_settings_module/data/models/not_setting_item.dart';

import '../database/noti_settings_db_provider.dart';

class NotificationsSettingsLocalDataSource
    extends AbstractNotificationsSettingsDataSource {
  NotificationsSettingsDBProvider dbProvider;
  NotificationsSettingsLocalDataSource({required this.dbProvider});
  @override
  Future<List<NotSettingItem>> getNotificationsSettings() async {
    final items = await dbProvider.getAllZikrSettings();
    if (items != null) {
      return items;
    } else {
      throw LocalDBException(
          " Couldn't get Zikr Settings from the local database");
    }
  }

  @override
  Future<void> createZikrIfNotExists(NotSettingItem zikr) async {
    final item = await dbProvider.getZikrSetting(zikr.zikrAudioId);
    if (item == null) {
      final res = await dbProvider.createZikrSetting(zikr);
      if (res == null) {
        throw LocalDBException(
            "Couldn't create Zikr settings for ${zikr.toJson()}");
      }
    }
  }

  @override
  Future<void> disableNotification(int zikrId) async {
    final item = await dbProvider.getZikrSetting(zikrId);
    if (item != null) {
      final res = await dbProvider
          .updateZikrSetting(item.copyWith(notificationEnabled: false));
      if (!res) {
        throw LocalDBException(
            "couldn't disable notifications on Zikr: ${item.toJson()}");
      }
    }
    throw LocalDBException("Couldn't find Zikr with Id $zikrId");
  }

  @override
  Future<void> enableNotification(int zikrId, Duration duration) async {
    final item = await dbProvider.getZikrSetting(zikrId);
    if (item != null) {
      final res = await dbProvider.updateZikrSetting(item.copyWith(
          notificationEnabled: true,
          notificationIntervalMinutes: duration.inMinutes));
      if (!res) {
        throw LocalDBException(
            "couldn't enable notifications on Zikr: ${item.toJson()}");
      }
    }
    throw LocalDBException("Couldn't find Zikr with Id $zikrId");
  }
}

abstract class AbstractNotificationsSettingsDataSource {
  Future<List<NotSettingItem>> getNotificationsSettings();

  Future<void> enableNotification(int zikrId, Duration duration);
  Future<void> disableNotification(int zikrId);

  Future<void> createZikrIfNotExists(NotSettingItem zikr);
}
