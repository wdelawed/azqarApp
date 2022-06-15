import 'package:equatable/equatable.dart';

class PrayerDate extends Equatable {
  final String? day;
  final String? month;
  final String? year;

  const PrayerDate({this.day, this.month, this.year});

  factory PrayerDate.fromJson(Map<String, dynamic> json) => PrayerDate(
        day: json['day'] as String?,
        month: json['month'] as String?,
        year: json['year'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'day': day,
        'month': month,
        'year': year,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [day, month, year];
}
