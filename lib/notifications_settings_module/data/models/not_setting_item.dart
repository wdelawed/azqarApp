import 'dart:convert';

import 'package:equatable/equatable.dart';

class NotSettingItem extends Equatable {
  final int zikrAudioId;
  final String zikrName;
  final bool notificationEnabled;
  final int? notificationIntervalMinutes;
  final String soundTrackUrl;
  final String? notificationPeriodArabic;
  final String? notificationPeriodEnglish;

  const NotSettingItem({
    required this.zikrAudioId,
    required this.zikrName,
    required this.notificationEnabled,
    this.notificationIntervalMinutes,
    required this.soundTrackUrl,
    this.notificationPeriodArabic,
    this.notificationPeriodEnglish,
  });

  factory NotSettingItem.fromMap(Map<String, dynamic> data) {
    return NotSettingItem(
      zikrAudioId: data['zikrAudioId'] as int,
      zikrName: data['zikrName'] as String,
      notificationEnabled:
          ((data['notificationEnabled'] as int) == 1) ? true : false,
      notificationIntervalMinutes: data['notificationIntervalMinutes'] as int?,
      soundTrackUrl: data['soundTrackUrl'] as String,
      notificationPeriodArabic: data['notificationPeriodArabic'] as String?,
      notificationPeriodEnglish: data['notificationPeriodEnglish'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'zikrAudioId': zikrAudioId,
        'zikrName': zikrName,
        'notificationEnabled': notificationEnabled == true ? 1 : 0,
        'notificationIntervalMinutes': notificationIntervalMinutes,
        'soundTrackUrl': soundTrackUrl,
        'notificationPeriodArabic': notificationPeriodArabic,
        'notificationPeriodEnglish': notificationPeriodEnglish,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NotSettingItem].
  factory NotSettingItem.fromJson(String data) {
    return NotSettingItem.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory NotSettingItem.fromZikrJson(json) => NotSettingItem(
      zikrAudioId: json["audioId"],
      zikrName: json["audioName"],
      notificationEnabled: false,
      soundTrackUrl: json["file"]);

  /// `dart:convert`
  ///
  /// Converts [NotSettingItem] to a JSON string.
  String toJson() => json.encode(toMap());

  NotSettingItem copyWith({
    int? zikrAudioId,
    String? zikrName,
    bool? notificationEnabled,
    int? notificationIntervalMinutes,
    String? soundTrackUrl,
    String? notificationPeriodArabic,
    String? notificationPeriodEnglish,
  }) {
    return NotSettingItem(
      zikrAudioId: zikrAudioId ?? this.zikrAudioId,
      zikrName: zikrName ?? this.zikrName,
      notificationEnabled: notificationEnabled ?? this.notificationEnabled,
      notificationIntervalMinutes:
          notificationIntervalMinutes ?? this.notificationIntervalMinutes,
      soundTrackUrl: soundTrackUrl ?? this.soundTrackUrl,
      notificationPeriodArabic:
          notificationPeriodArabic ?? this.notificationPeriodArabic,
      notificationPeriodEnglish:
          notificationPeriodEnglish ?? this.notificationPeriodEnglish,
    );
  }

  @override
  List<Object?> get props {
    return [
      zikrAudioId,
      zikrName,
      notificationEnabled,
      notificationIntervalMinutes,
      soundTrackUrl,
      notificationPeriodArabic,
      notificationPeriodEnglish,
    ];
  }
}
