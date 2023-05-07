import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:learning_programming/models/model_file.dart';
import 'package:learning_programming/models/model_iteractionoption_item.dart';

class ModelIteractionModule {
  final List<ModelFile> files;
  final String type;
  final List<ModelIteractionOptionItem> interactionOptions;
  final List<String> wrongOptions;
  ModelIteractionModule({
    required this.files,
    required this.type,
    required this.interactionOptions,
    required this.wrongOptions,
  });

  ModelIteractionModule copyWith({
    List<ModelFile>? files,
    String? type,
    List<ModelIteractionOptionItem>? interactionOptions,
    List<String>? wrongOptions,
  }) {
    return ModelIteractionModule(
      files: files ?? this.files,
      type: type ?? this.type,
      interactionOptions: interactionOptions ?? this.interactionOptions,
      wrongOptions: wrongOptions ?? this.wrongOptions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'files': files.map((x) => x.toMap()).toList(),
      'type': type,
      'interactionOptions': interactionOptions.map((x) => x.toMap()).toList(),
      'wrongOptions': wrongOptions,
    };
  }

  factory ModelIteractionModule.fromMap(Map<String, dynamic> map) {
    return ModelIteractionModule(
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

  factory ModelIteractionModule.fromJson(String source) =>
      ModelIteractionModule.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ModelIteractionModule(files: $files, type: $type, interactionOptions: $interactionOptions, wrongOptions: $wrongOptions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelIteractionModule &&
        listEquals(other.files, files) &&
        other.type == type &&
        listEquals(other.interactionOptions, interactionOptions) &&
        listEquals(other.wrongOptions, wrongOptions);
  }

  @override
  int get hashCode {
    return files.hashCode ^
        type.hashCode ^
        interactionOptions.hashCode ^
        wrongOptions.hashCode;
  }
}
