import 'dart:convert';

import 'package:equatable/equatable.dart';

class Designation extends Equatable {
  final String? abbreviated;
  final String? expanded;

  const Designation({this.abbreviated, this.expanded});

  factory Designation.fromMap(Map<String, dynamic> data) => Designation(
        abbreviated: data['abbreviated'] as String?,
        expanded: data['expanded'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'abbreviated': abbreviated,
        'expanded': expanded,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Designation].
  factory Designation.fromJson(String data) {
    return Designation.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Designation] to a JSON string.
  String toJson() => json.encode(toMap());

  Designation copyWith({
    String? abbreviated,
    String? expanded,
  }) {
    return Designation(
      abbreviated: abbreviated ?? this.abbreviated,
      expanded: expanded ?? this.expanded,
    );
  }

  @override
  List<Object?> get props => [abbreviated, expanded];
}
