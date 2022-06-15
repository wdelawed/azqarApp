import 'dart:convert';

import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final double? latitude;
  final double? longitude;

  const Location({this.latitude, this.longitude});

  factory Location.fromMap(Map<String, dynamic> data) => Location(
        latitude: (data['latitude'] as num?)?.toDouble(),
        longitude: (data['longitude'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'latitude': latitude,
        'longitude': longitude,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Location].
  factory Location.fromJson(String data) {
    return Location.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Location] to a JSON string.
  String toJson() => json.encode(toMap());

  Location copyWith({
    double? latitude,
    double? longitude,
  }) {
    return Location(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  List<Object?> get props => [latitude, longitude];
}
