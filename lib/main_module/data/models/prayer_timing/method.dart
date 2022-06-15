import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'location.dart';
import 'params.dart';

class Method extends Equatable {
  final int? id;
  final String? name;
  final Params? params;
  final Location? location;

  const Method({this.id, this.name, this.params, this.location});

  factory Method.fromMap(Map<String, dynamic> data) => Method(
        id: data['id'] as int?,
        name: data['name'] as String?,
        params: data['params'] == null
            ? null
            : Params.fromMap(data['params'] as Map<String, dynamic>),
        location: data['location'] == null
            ? null
            : Location.fromMap(data['location'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'params': params?.toMap(),
        'location': location?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Method].
  factory Method.fromJson(String data) {
    return Method.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Method] to a JSON string.
  String toJson() => json.encode(toMap());

  Method copyWith({
    int? id,
    String? name,
    Params? params,
    Location? location,
  }) {
    return Method(
      id: id ?? this.id,
      name: name ?? this.name,
      params: params ?? this.params,
      location: location ?? this.location,
    );
  }

  @override
  List<Object?> get props => [id, name, params, location];
}
