import 'dart:convert';

import 'package:learning_programming/models/model_text.dart';

class ModelIteractionOptionItem {
  final ModelText text;
  final bool correctOption;

  ModelIteractionOptionItem({
    required this.text,
    required this.correctOption,
  });

  ModelIteractionOptionItem copyWith({
    ModelText? text,
    bool? correctOption,
  }) {
    return ModelIteractionOptionItem(
      text: text ?? this.text,
      correctOption: correctOption ?? this.correctOption,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text.toMap(),
      'correctOption': correctOption,
    };
  }

  factory ModelIteractionOptionItem.fromMap(Map<String, dynamic> map) {
    return ModelIteractionOptionItem(
      text: ModelText.fromMap(map['text']),
      correctOption: map['correctOption'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelIteractionOptionItem.fromJson(String source) =>
      ModelIteractionOptionItem.fromMap(json.decode(source));

  @override
  String toString() =>
      'ModelIteractionOptionItem(text: $text, correctOption: $correctOption)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelIteractionOptionItem &&
        other.text == text &&
        other.correctOption == correctOption;
  }

  @override
  int get hashCode => text.hashCode ^ correctOption.hashCode;
}
