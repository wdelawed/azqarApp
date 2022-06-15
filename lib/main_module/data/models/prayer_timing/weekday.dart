import 'dart:convert';

import 'package:equatable/equatable.dart';

class Weekday extends Equatable {
  final String? en;

  const Weekday({this.en});

  factory Weekday.fromMap(Map<String, dynamic> data) => Weekday(
        en: data['en'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'en': en,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Weekday].
  factory Weekday.fromJson(String data) {
    return Weekday.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Weekday] to a JSON string.
  String toJson() => json.encode(toMap());

  Weekday copyWith({
    String? en,
  }) {
    return Weekday(
      en: en ?? this.en,
    );
  }

  @override
  List<Object?> get props => [en];
}
