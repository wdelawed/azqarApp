import 'dart:convert';

import 'package:equatable/equatable.dart';

class ZikrNotificationDuration extends Equatable {
  final int durationMinutes;
  final String periodArabic;
  final String periodEnglish;

  const ZikrNotificationDuration({
    required this.durationMinutes,
    required this.periodArabic,
    required this.periodEnglish,
  });

  factory ZikrNotificationDuration.fromMap(Map<String, dynamic> data) {
    return ZikrNotificationDuration(
      durationMinutes: data['durationMinutes'] as int,
      periodArabic: data['periodArabic'] as String,
      periodEnglish: data['periodEnglish'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        'durationMinutes': durationMinutes,
        'periodArabic': periodArabic,
        'periodEnglish': periodEnglish,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ZikrNotificationDuration].
  factory ZikrNotificationDuration.fromJson(String data) {
    return ZikrNotificationDuration.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ZikrNotificationDuration] to a JSON string.
  String toJson() => json.encode(toMap());

  ZikrNotificationDuration copyWith({
    int? durationMinutes,
    String? periodArabic,
    String? periodEnglish,
  }) {
    return ZikrNotificationDuration(
      durationMinutes: durationMinutes ?? this.durationMinutes,
      periodArabic: periodArabic ?? this.periodArabic,
      periodEnglish: periodEnglish ?? this.periodEnglish,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      durationMinutes,
      periodArabic,
      periodEnglish,
    ];
  }
}
