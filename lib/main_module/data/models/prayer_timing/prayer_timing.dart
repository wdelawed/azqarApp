import 'dart:convert';

import 'package:azkar/main_module/domain/entities/prayer_timing_entity/hijri.dart';
import 'package:azkar/main_module/domain/entities/prayer_timing_entity/prayer_timing_entity.dart';
import 'package:azkar/main_module/domain/entities/prayer_timing_entity/timings.dart'
    as pt;
import 'package:equatable/equatable.dart';

import '../../../../config/global_dart.dart';
import 'date.dart';
import 'meta.dart';
import 'timings.dart';

class PrayerTiming extends Equatable {
  final Timings? timings;
  final Date? date;
  final Meta? meta;

  const PrayerTiming({this.timings, this.date, this.meta});

  factory PrayerTiming.fromMap(Map<String, dynamic> data) => PrayerTiming(
        timings: data['timings'] == null
            ? null
            : Timings.fromMap(data['timings'] as Map<String, dynamic>),
        date: data['date'] == null
            ? null
            : Date.fromMap(data['date'] as Map<String, dynamic>),
        meta: data['meta'] == null
            ? null
            : Meta.fromMap(data['meta'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'timings': timings?.toMap(),
        'date': date?.toMap(),
        'meta': meta?.toMap(),
      };

  PrayerTimingEntity toEntity() => PrayerTimingEntity(
        timings: pt.Timings(
            fajr: timings?.fajr?.split(" ")[0],
            sunrise: timings?.sunrise?.split(" ")[0],
            dhuhr: timings?.dhuhr?.split(" ")[0],
            asr: timings?.asr?.split(" ")[0],
            maghrib: timings?.maghrib?.split(" ")[0],
            isha: timings?.isha?.split(" ")[0]),
        gregorian: PrayerDate(
            day: date?.gregorian?.day,
            month: months[date?.gregorian?.month?.number],
            year: date?.gregorian?.year),
        hijri: PrayerDate(
            day: date?.hijri?.day,
            month: date?.hijri?.month?.ar,
            year: date?.hijri?.year),
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PrayerTiming].
  factory PrayerTiming.fromJson(String data) {
    return PrayerTiming.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PrayerTiming] to a JSON string.
  String toJson() => json.encode(toMap());

  PrayerTiming copyWith({
    Timings? timings,
    Date? date,
    Meta? meta,
  }) {
    return PrayerTiming(
      timings: timings ?? this.timings,
      date: date ?? this.date,
      meta: meta ?? this.meta,
    );
  }

  @override
  List<Object?> get props => [timings, date, meta];
}
