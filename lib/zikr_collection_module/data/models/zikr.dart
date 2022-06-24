import 'dart:convert';

import 'package:azkar/zikr_collection_module/domain/entities/zikr_entity.dart';
import 'package:equatable/equatable.dart';

class Zikr extends Equatable {
  final int? audioId;
  final String? audioName;
  final String? audioType;
  final String? file;
  final DateTime? createdOn;

  const Zikr({
    this.audioId,
    this.audioName,
    this.audioType,
    this.file,
    this.createdOn,
  });

  ZikrEntity toEntity() => ZikrEntity(name: audioName, url: file, id: audioId);

  factory Zikr.fromMap(Map<String, dynamic> data) => Zikr(
        audioId: data['audioId'] as int?,
        audioName: data['audioName'] as String?,
        audioType: data['audioType'] as String?,
        file: data['file'] as String?,
        createdOn: data['createdOn'] == null
            ? null
            : DateTime.parse(data['createdOn'] as String),
      );

  Map<String, dynamic> toMap() => {
        'audioId': audioId,
        'audioName': audioName,
        'audioType': audioType,
        'file': file,
        'createdOn': createdOn?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Zikr].
  factory Zikr.fromJson(String data) {
    return Zikr.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Zikr] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      audioId,
      audioName,
      audioType,
      file,
      createdOn,
    ];
  }
}
