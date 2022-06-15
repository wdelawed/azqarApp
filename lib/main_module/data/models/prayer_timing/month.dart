import 'dart:convert';

import 'package:equatable/equatable.dart';

class Month extends Equatable {
  final int? number;
  final String? en;
  final String? ar;

  const Month({this.number, this.en, this.ar});

  factory Month.fromMap(Map<String, dynamic> data) => Month(
      number: data['number'] as int?,
      en: data['en'] as String?,
      ar: data["ar"] as String?);

  Map<String, dynamic> toMap() => {
        'number': number,
        'en': en,
        'ar': ar,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Month].
  factory Month.fromJson(String data) {
    return Month.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Month] to a JSON string.
  String toJson() => json.encode(toMap());

  Month copyWith({
    int? number,
    String? en,
    String? ar,
  }) {
    return Month(
        number: number ?? this.number, en: en ?? this.en, ar: ar ?? this.ar);
  }

  @override
  List<Object?> get props => [number, en, ar];
}
