import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'method.dart';
import 'offset.dart';

class Meta extends Equatable {
  final double? latitude;
  final double? longitude;
  final String? timezone;
  final Method? method;
  final String? latitudeAdjustmentMethod;
  final String? midnightMode;
  final String? school;
  final Offset? offset;

  const Meta({
    this.latitude,
    this.longitude,
    this.timezone,
    this.method,
    this.latitudeAdjustmentMethod,
    this.midnightMode,
    this.school,
    this.offset,
  });

  factory Meta.fromMap(Map<String, dynamic> data) => Meta(
        latitude: (data['latitude'] as num?)?.toDouble(),
        longitude: (data['longitude'] as num?)?.toDouble(),
        timezone: data['timezone'] as String?,
        method: data['method'] == null
            ? null
            : Method.fromMap(data['method'] as Map<String, dynamic>),
        latitudeAdjustmentMethod: data['latitudeAdjustmentMethod'] as String?,
        midnightMode: data['midnightMode'] as String?,
        school: data['school'] as String?,
        offset: data['offset'] == null
            ? null
            : Offset.fromMap(data['offset'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'latitude': latitude,
        'longitude': longitude,
        'timezone': timezone,
        'method': method?.toMap(),
        'latitudeAdjustmentMethod': latitudeAdjustmentMethod,
        'midnightMode': midnightMode,
        'school': school,
        'offset': offset?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Meta].
  factory Meta.fromJson(String data) {
    return Meta.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Meta] to a JSON string.
  String toJson() => json.encode(toMap());

  Meta copyWith({
    double? latitude,
    double? longitude,
    String? timezone,
    Method? method,
    String? latitudeAdjustmentMethod,
    String? midnightMode,
    String? school,
    Offset? offset,
  }) {
    return Meta(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      timezone: timezone ?? this.timezone,
      method: method ?? this.method,
      latitudeAdjustmentMethod:
          latitudeAdjustmentMethod ?? this.latitudeAdjustmentMethod,
      midnightMode: midnightMode ?? this.midnightMode,
      school: school ?? this.school,
      offset: offset ?? this.offset,
    );
  }

  @override
  List<Object?> get props {
    return [
      latitude,
      longitude,
      timezone,
      method,
      latitudeAdjustmentMethod,
      midnightMode,
      school,
      offset,
    ];
  }
}
