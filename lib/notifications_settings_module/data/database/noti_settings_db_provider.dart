import 'package:azkar/notifications_settings_module/data/models/not_setting_item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotificationsSettingsDBProvider {
  static final NotificationsSettingsDBProvider _dbProvider =
      NotificationsSettingsDBProvider._internal();
  factory NotificationsSettingsDBProvider() => _dbProvider;

  NotificationsSettingsDBProvider._internal();

  Database? _db;

  String tableName = "notiSettingsTable";
  String dBName = "notiSettingsDatabase.db";
  String zikrAudioId = "zikrAudioId";
  String zikrName = "zikrName";
  String notificationEnabled = "notificationEnabled";
  String notificationIntervalMinutes = "notificationIntervalMinutes";
  String soundTrackUrl = "soundTrackUrl";
  String notificationPeriodArabic = "notificationPeriodArabic";
  String notificationPeriodEnglish = "notificationPeriodEnglish";

  Future<void> openDB() async {
    String path = await getDatabasesPath();
    path = join(path, dBName);
    _db ??=
        await openDatabase(path, version: 1, onCreate: ((db, version) async {
      await db.execute('''
        create table $tableName ( 
          $zikrAudioId integer primary key, 
          $zikrName text not null,
          $notificationEnabled integer not null,
          $notificationIntervalMinutes integer,
          $soundTrackUrl text,
          $notificationPeriodArabic text,
          $notificationPeriodEnglish text
          )
        ''');
    }));
  }

  Future<NotSettingItem?> createZikrSetting(NotSettingItem zikr) async {
    await openDB();
    if (_db?.isOpen ?? false) {
      final res = await _db?.insert(tableName, zikr.toMap());
      return res == zikr.zikrAudioId ? zikr : null;
    }
    return null;
  }

  Future<bool> updateZikrSetting(NotSettingItem updatedZikr) async {
    await openDB();
    if (_db?.isOpen ?? false) {
      final res = await _db?.update(tableName, updatedZikr.toMap(),
          where: "$zikrAudioId=?", whereArgs: [updatedZikr.zikrAudioId]);
      return (res ?? 0) > -1;
    }
    return false;
  }

  Future<NotSettingItem?> getZikrSetting(int id) async {
    await openDB();
    if (_db?.isOpen ?? false) {
      final res = await _db
              ?.rawQuery("SELECT * FROM $tableName WHERE $zikrAudioId = $id") ??
          [];
      if (res.isNotEmpty) {
        return NotSettingItem.fromMap(res.first);
      }
    }
    return null;
  }

  Future<List<NotSettingItem>?> getAllZikrSettings() async {
    await openDB();
    if (_db?.isOpen ?? false) {
      final res = await _db?.rawQuery("SELECT * FROM $tableName") ?? [];
      if (res.isNotEmpty) {
        return res.map((e) => NotSettingItem.fromMap(e)).toList();
      }
    }
    return null;
  }
}
