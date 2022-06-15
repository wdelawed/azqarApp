import 'package:equatable/equatable.dart';

import 'hijri.dart';
import 'timings.dart';

class PrayerTimingEntity extends Equatable {
  final Timings? timings;
  final PrayerDate? hijri;
  final PrayerDate? gregorian;

  const PrayerTimingEntity({this.timings, this.hijri, this.gregorian});

  factory PrayerTimingEntity.fromJson(Map<String, dynamic> json) {
    return PrayerTimingEntity(
      timings: json['timings'] == null
          ? null
          : Timings.fromJson(json['timings'] as Map<String, dynamic>),
      hijri: json['hijri'] == null
          ? null
          : PrayerDate.fromJson(json['hijri'] as Map<String, dynamic>),
      gregorian: json['gregorian'] == null
          ? null
          : PrayerDate.fromJson(json['gregorian'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'timings': timings?.toJson(),
        'hijri': hijri?.toJson(),
        'gregorian': gregorian?.toJson(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [timings, hijri, gregorian];
}
