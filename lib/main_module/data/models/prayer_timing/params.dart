import 'dart:convert';

import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final int? fajr;
  final int? isha;

  const Params({this.fajr, this.isha});

  factory Params.fromMap(Map<String, dynamic> data) => Params(
        fajr: data['Fajr'] as int?,
        isha: data['Isha'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'Fajr': fajr,
        'Isha': isha,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Params].
  factory Params.fromJson(String data) {
    return Params.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Params] to a JSON string.
  String toJson() => json.encode(toMap());

  Params copyWith({
    int? fajr,
    int? isha,
  }) {
    return Params(
      fajr: fajr ?? this.fajr,
      isha: isha ?? this.isha,
    );
  }

  @override
  List<Object?> get props => [fajr, isha];
}
