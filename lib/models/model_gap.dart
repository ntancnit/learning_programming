import 'dart:convert';

class ModelGap {
  final String content;
  final bool editable;

  ModelGap({
    required this.content,
    required this.editable,
  });

  ModelGap copyWith({
    String? content,
    bool? editable,
  }) {
    return ModelGap(
      content: content ?? this.content,
      editable: editable ?? this.editable,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'editable': editable,
    };
  }

  factory ModelGap.fromMap(Map<String, dynamic> map) {
    return ModelGap(
      content: map['content'],
      editable: map['editable'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelGap.fromJson(String source) =>
      ModelGap.fromMap(json.decode(source));

  @override
  String toString() => 'ModelGap(content: $content, editable: $editable)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelGap &&
        other.content == content &&
        other.editable == editable;
  }

  @override
  int get hashCode => content.hashCode ^ editable.hashCode;
}
