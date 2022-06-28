import 'package:azkar/notifications_settings_module/data/models/not_setting_item.dart';

//Note: This entity is never used and probably will be removed
class NotItemSettingsEntity extends NotSettingItem {
  const NotItemSettingsEntity(
      {required super.zikrAudioId,
      required super.zikrName,
      required super.notificationEnabled,
      required super.soundTrackUrl});
}
