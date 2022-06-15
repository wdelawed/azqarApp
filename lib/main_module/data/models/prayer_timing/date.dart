import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'gregorian.dart';
import 'hijri.dart';

class Date extends Equatable {
  final String? readable;
  final String? timestamp;
  final Gregorian? gregorian;
  final Hijri? hijri;

  const Date({this.readable, this.timestamp, this.gregorian, this.hijri});

  factory Date.fromMap(Map<String, dynamic> data) => Date(
        readable: data['readable'] as String?,
        timestamp: data['timestamp'] as String?,
        gregorian: data['gregorian'] == null
            ? null
            : Gregorian.fromMap(data['gregorian'] as Map<String, dynamic>),
        hijri: data['hijri'] == null
            ? null
            : Hijri.fromMap(data['hijri'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'readable': readable,
        'timestamp': timestamp,
        'gregorian': gregorian?.toMap(),
        'hijri': hijri?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Date].
  factory Date.fromJson(String data) {
    return Date.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Date] to a JSON string.
  String toJson() => json.encode(toMap());

  Date copyWith({
    String? readable,
    String? timestamp,
    Gregorian? gregorian,
    Hijri? hijri,
  }) {
    return Date(
      readable: readable ?? this.readable,
      timestamp: timestamp ?? this.timestamp,
      gregorian: gregorian ?? this.gregorian,
      hijri: hijri ?? this.hijri,
    );
  }

  @override
  List<Object?> get props => [readable, timestamp, gregorian, hijri];
}
