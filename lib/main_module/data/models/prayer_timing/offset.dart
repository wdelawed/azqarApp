import 'dart:convert';

import 'package:equatable/equatable.dart';

class Offset extends Equatable {
  final int? imsak;
  final int? fajr;
  final int? sunrise;
  final int? dhuhr;
  final int? asr;
  final int? maghrib;
  final int? sunset;
  final int? isha;
  final int? midnight;

  const Offset({
    this.imsak,
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.sunset,
    this.isha,
    this.midnight,
  });

  factory Offset.fromMap(Map<String, dynamic> data) => Offset(
        imsak: data['Imsak'] as int?,
        fajr: data['Fajr'] as int?,
        sunrise: data['Sunrise'] as int?,
        dhuhr: data['Dhuhr'] as int?,
        asr: data['Asr'] as int?,
        maghrib: data['Maghrib'] as int?,
        sunset: data['Sunset'] as int?,
        isha: data['Isha'] as int?,
        midnight: data['Midnight'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'Imsak': imsak,
        'Fajr': fajr,
        'Sunrise': sunrise,
        'Dhuhr': dhuhr,
        'Asr': asr,
        'Maghrib': maghrib,
        'Sunset': sunset,
        'Isha': isha,
        'Midnight': midnight,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Offset].
  factory Offset.fromJson(String data) {
    return Offset.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Offset] to a JSON string.
  String toJson() => json.encode(toMap());

  Offset copyWith({
    int? imsak,
    int? fajr,
    int? sunrise,
    int? dhuhr,
    int? asr,
    int? maghrib,
    int? sunset,
    int? isha,
    int? midnight,
  }) {
    return Offset(
      imsak: imsak ?? this.imsak,
      fajr: fajr ?? this.fajr,
      sunrise: sunrise ?? this.sunrise,
      dhuhr: dhuhr ?? this.dhuhr,
      asr: asr ?? this.asr,
      maghrib: maghrib ?? this.maghrib,
      sunset: sunset ?? this.sunset,
      isha: isha ?? this.isha,
      midnight: midnight ?? this.midnight,
    );
  }

  @override
  List<Object?> get props {
    return [
      imsak,
      fajr,
      sunrise,
      dhuhr,
      asr,
      maghrib,
      sunset,
      isha,
      midnight,
    ];
  }
}
