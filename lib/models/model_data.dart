import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:learning_programming/models/model_file.dart';
import 'package:learning_programming/models/model_iteraction_module.dart';
import 'package:learning_programming/models/model_iteractionoption_item.dart';
import 'model_preiteraction_item.dart';

class ModelData {
  final String id;
  final List<ModelPreIterationItem> preInteraction;
  final ModelIteractionModule interactionModule;
  final List<ModelPreIterationItem> postInteraction;
  final List<ModelFile> files;
  final String type;
  final List<ModelIteractionOptionItem> interactionOptions;
  final List<String> wrongOptions;

  ModelData({
    required this.id,
    required this.preInteraction,
    required this.interactionModule,
    required this.postInteraction,
    required this.files,
    required this.type,
    required this.interactionOptions,
    required this.wrongOptions,
  });

  ModelData copyWith({
    String? id,
    List<ModelPreIterationItem>? preInteraction,
    ModelIteractionModule? interactionModule,
    List<ModelPreIterationItem>? postInteraction,
    List<ModelFile>? files,
    String? type,
    List<ModelIteractionOptionItem>? interactionOptions,
    List<String>? wrongOptions,
  }) {
    return ModelData(
      id: id ?? this.id,
      preInteraction: preInteraction ?? this.preInteraction,
      interactionModule: interactionModule ?? this.interactionModule,
      postInteraction: postInteraction ?? this.postInteraction,
      files: files ?? this.files,
      type: type ?? this.type,
      interactionOptions: interactionOptions ?? this.interactionOptions,
      wrongOptions: wrongOptions ?? this.wrongOptions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'preInteraction': preInteraction.map((x) => x.toMap()).toList(),
      'interactionModule': interactionModule.toMap(),
      'postInteraction': postInteraction.map((x) => x.toMap()).toList(),
      'files': files.map((x) => x.toMap()).toList(),
      'type': type,
      'interactionOptions': interactionOptions.map((x) => x.toMap()).toList(),
      'wrongOptions': wrongOptions,
    };
  }

  factory ModelData.fromMap(Map<String, dynamic> map) {
    return ModelData(
      id: map['id'] ?? '',
      preInteraction: List<ModelPreIterationItem>.from(
          map['preInteraction']?.map((x) => ModelPreIterationItem.fromMap(x))),
      interactionModule:
          ModelIteractionModule.fromMap(map['interactionModule']),
      postInteraction: List<ModelPreIterationItem>.from(
          map['postInteraction']?.map((x) => ModelPreIterationItem.fromMap(x))),
      files:
          List<ModelFile>.from(map['files']?.map((x) => ModelFile.fromMap(x))),
      type: map['type'] ?? '',
      interactionOptions: List<ModelIteractionOptionItem>.from(
          map['interactionOptions']
              ?.map((x) => ModelIteractionOptionItem.fromMap(x))),
      wrongOptions: List<String>.from(map['wrongOptions']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelData.fromJson(String source) =>
      ModelData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ModelData(id: $id, preInteraction: $preInteraction, interactionModule: $interactionModule, postInteraction: $postInteraction, files: $files, type: $type, interactionOptions: $interactionOptions, wrongOptions: $wrongOptions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelData &&
        other.id == id &&
        listEquals(other.preInteraction, preInteraction) &&
        other.interactionModule == interactionModule &&
        listEquals(other.postInteraction, postInteraction) &&
        listEquals(other.files, files) &&
        other.type == type &&
        listEquals(other.interactionOptions, interactionOptions) &&
        listEquals(other.wrongOptions, wrongOptions);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        preInteraction.hashCode ^
        interactionModule.hashCode ^
        postInteraction.hashCode ^
        files.hashCode ^
        type.hashCode ^
        interactionOptions.hashCode ^
        wrongOptions.hashCode;
  }
}
