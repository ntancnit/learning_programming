import 'dart:convert';

class ModelFile {
  final String codeLanguage;
  final bool isInteractive;
  final String content;
  final String name;

  ModelFile({
    required this.codeLanguage,
    required this.isInteractive,
    required this.content,
    required this.name,
  });

  ModelFile copyWith({
    String? codeLanguage,
    bool? isInteractive,
    String? content,
    String? name,
  }) {
    return ModelFile(
      codeLanguage: codeLanguage ?? this.codeLanguage,
      isInteractive: isInteractive ?? this.isInteractive,
      content: content ?? this.content,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'codeLanguage': codeLanguage,
      'isInteractive': isInteractive,
      'content': content,
      'name': name,
    };
  }

  factory ModelFile.fromMap(Map<String, dynamic> map) {
    return ModelFile(
      codeLanguage: map['codeLanguage'] ?? '',
      isInteractive: map['isInteractive'] ?? false,
      content: map['content'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelFile.fromJson(String source) =>
      ModelFile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ModelFile(codeLanguage: $codeLanguage, isInteractive: $isInteractive, content: $content, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelFile &&
        other.codeLanguage == codeLanguage &&
        other.isInteractive == isInteractive &&
        other.content == content &&
        other.name == name;
  }

  @override
  int get hashCode {
    return codeLanguage.hashCode ^
        isInteractive.hashCode ^
        content.hashCode ^
        name.hashCode;
  }
}
