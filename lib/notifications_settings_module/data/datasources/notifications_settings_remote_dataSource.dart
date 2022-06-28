import 'dart:convert';

import 'package:azkar/azkar_cache_manager.dart';
import 'package:azkar/main_module/data/exceptions.dart';
import 'package:azkar/notifications_settings_module/data/datasources/notifications_settings_module_remote_data_source.dart';
import 'package:azkar/notifications_settings_module/data/models/not_setting_item.dart';
import 'package:http/http.dart' as http;

class NotificationsSettingsRemoteDataSource
    implements AbstractNotificationsSettingsDataSource {
  http.Client client;
  NotificationsSettingsRemoteDataSource({required this.client});
  @override
  Future<void> createZikrIfNotExists(NotSettingItem zikr) {
    throw UnimplementedError();
  }

  @override
  Future<void> disableNotification(int zikrId) {
    throw UnimplementedError();
  }

  @override
  Future<void> enableNotification(int zikrId, Duration duration) {
    throw UnimplementedError();
  }

  @override
  Future<List<NotSettingItem>> getNotificationsSettings() async {
    final res = await client.get(Uri.parse(
        "http://nebroprog10-001-site1.itempurl.com/AudioFiles/AudiosList"));

    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      final azkarList = (json["audioFilesList"] as List)
          .map((e) => NotSettingItem.fromZikrJson(e))
          .toList();
      for (var zikr in azkarList) {
        AzkraCacheManager.instance
            .getFileFromCache("ZikrFile${zikr.zikrAudioId}")
            .then((fileinfo) => {
                  if (fileinfo == null)
                    {
                      AzkraCacheManager.instance.downloadFile(
                          zikr.soundTrackUrl,
                          key: "ZikrFile${zikr.zikrAudioId}",
                          force: true)
                    }
                });
      }
      return azkarList;
    }
    throw ServerException("Invalid response");
  }
}
