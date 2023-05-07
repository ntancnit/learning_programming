import 'dart:convert';

class ModelText {
  final int position;
  final int start;
  final int end;
  final int length;
  final String text;

  ModelText({
    required this.position,
    required this.start,
    required this.end,
    required this.length,
    required this.text,
  });

  ModelText copyWith({
    int? position,
    int? start,
    int? end,
    int? length,
    String? text,
  }) {
    return ModelText(
      position: position ?? this.position,
      start: start ?? this.start,
      end: end ?? this.end,
      length: length ?? this.length,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'position': position,
      'start': start,
      'end': end,
      'length': length,
      'text': text,
    };
  }

  factory ModelText.fromMap(Map<String, dynamic> map) {
    return ModelText(
      position: map['position']?.toInt() ?? 0,
      start: map['start']?.toInt() ?? 0,
      end: map['end']?.toInt() ?? 0,
      length: map['length']?.toInt() ?? 0,
      text: map['text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelText.fromJson(String source) =>
      ModelText.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ModelText(position: $position, start: $start, end: $end, length: $length, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelText &&
        other.position == position &&
        other.start == start &&
        other.end == end &&
        other.length == length &&
        other.text == text;
  }

  @override
  int get hashCode {
    return position.hashCode ^
        start.hashCode ^
        end.hashCode ^
        length.hashCode ^
        text.hashCode;
  }
}
