import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'designation.dart';
import 'month.dart';
import 'weekday.dart';

class Gregorian extends Equatable {
  final String? date;
  final String? format;
  final String? day;
  final Weekday? weekday;
  final Month? month;
  final String? year;
  final Designation? designation;

  const Gregorian({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
  });

  factory Gregorian.fromMap(Map<String, dynamic> data) => Gregorian(
        date: data['date'] as String?,
        format: data['format'] as String?,
        day: data['day'] as String?,
        weekday: data['weekday'] == null
            ? null
            : Weekday.fromMap(data['weekday'] as Map<String, dynamic>),
        month: data['month'] == null
            ? null
            : Month.fromMap(data['month'] as Map<String, dynamic>),
        year: data['year'] as String?,
        designation: data['designation'] == null
            ? null
            : Designation.fromMap(data['designation'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'date': date,
        'format': format,
        'day': day,
        'weekday': weekday?.toMap(),
        'month': month?.toMap(),
        'year': year,
        'designation': designation?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Gregorian].
  factory Gregorian.fromJson(String data) {
    return Gregorian.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Gregorian] to a JSON string.
  String toJson() => json.encode(toMap());

  Gregorian copyWith({
    String? date,
    String? format,
    String? day,
    Weekday? weekday,
    Month? month,
    String? year,
    Designation? designation,
  }) {
    return Gregorian(
      date: date ?? this.date,
      format: format ?? this.format,
      day: day ?? this.day,
      weekday: weekday ?? this.weekday,
      month: month ?? this.month,
      year: year ?? this.year,
      designation: designation ?? this.designation,
    );
  }

  @override
  List<Object?> get props {
    return [
      date,
      format,
      day,
      weekday,
      month,
      year,
      designation,
    ];
  }
}
