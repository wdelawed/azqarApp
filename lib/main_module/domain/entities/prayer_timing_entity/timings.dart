import 'package:equatable/equatable.dart';

class Timings extends Equatable {
  final String? fajr;
  final String? sunrise;
  final String? dhuhr;
  final String? asr;
  final String? maghrib;
  final String? isha;

  const Timings({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  });

  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
        fajr: json['Fajr'] as String?,
        sunrise: json['Sunrise'] as String?,
        dhuhr: json['Dhuhr'] as String?,
        asr: json['Asr'] as String?,
        maghrib: json['Maghrib'] as String?,
        isha: json['Isha'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Fajr': fajr,
        'Sunrise': sunrise,
        'Dhuhr': dhuhr,
        'Asr': asr,
        'Maghrib': maghrib,
        'Isha': isha,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [fajr, sunrise, dhuhr, asr, maghrib, isha];
}
