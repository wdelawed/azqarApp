import 'dart:convert';

import 'package:equatable/equatable.dart';

class Timings extends Equatable {
  final String? fajr;
  final String? sunrise;
  final String? dhuhr;
  final String? asr;
  final String? sunset;
  final String? maghrib;
  final String? isha;
  final String? imsak;
  final String? midnight;

  const Timings({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
  });

  factory Timings.fromMap(Map<String, dynamic> data) => Timings(
        fajr: data['Fajr'] as String?,
        sunrise: data['Sunrise'] as String?,
        dhuhr: data['Dhuhr'] as String?,
        asr: data['Asr'] as String?,
        sunset: data['Sunset'] as String?,
        maghrib: data['Maghrib'] as String?,
        isha: data['Isha'] as String?,
        imsak: data['Imsak'] as String?,
        midnight: data['Midnight'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Fajr': fajr,
        'Sunrise': sunrise,
        'Dhuhr': dhuhr,
        'Asr': asr,
        'Sunset': sunset,
        'Maghrib': maghrib,
        'Isha': isha,
        'Imsak': imsak,
        'Midnight': midnight,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Timings].
  factory Timings.fromJson(String data) {
    return Timings.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Timings] to a JSON string.
  String toJson() => json.encode(toMap());

  Timings copyWith({
    String? fajr,
    String? sunrise,
    String? dhuhr,
    String? asr,
    String? sunset,
    String? maghrib,
    String? isha,
    String? imsak,
    String? midnight,
  }) {
    return Timings(
      fajr: fajr ?? this.fajr,
      sunrise: sunrise ?? this.sunrise,
      dhuhr: dhuhr ?? this.dhuhr,
      asr: asr ?? this.asr,
      sunset: sunset ?? this.sunset,
      maghrib: maghrib ?? this.maghrib,
      isha: isha ?? this.isha,
      imsak: imsak ?? this.imsak,
      midnight: midnight ?? this.midnight,
    );
  }

  @override
  List<Object?> get props {
    return [
      fajr,
      sunrise,
      dhuhr,
      asr,
      sunset,
      maghrib,
      isha,
      imsak,
      midnight,
    ];
  }
}
