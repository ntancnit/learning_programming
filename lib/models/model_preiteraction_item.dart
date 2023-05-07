import 'dart:convert';

class ModelPreIterationItem {
  final String text;
  final String type;
  final int order;
  final String id;
  final String visibleIf;

  ModelPreIterationItem({
    required this.text,
    required this.type,
    required this.order,
    required this.id,
    required this.visibleIf,
  });

  ModelPreIterationItem copyWith({
    String? text,
    String? type,
    int? order,
    String? id,
    String? visibleIf,
  }) {
    return ModelPreIterationItem(
      text: text ?? this.text,
      type: type ?? this.type,
      order: order ?? this.order,
      id: id ?? this.id,
      visibleIf: visibleIf ?? this.visibleIf,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'type': type,
      'order': order,
      'id': id,
      'visibleIf': visibleIf,
    };
  }

  factory ModelPreIterationItem.fromMap(Map<String, dynamic> map) {
    return ModelPreIterationItem(
      text: map['text'] ?? '',
      type: map['type'] ?? '',
      order: map['order']?.toInt() ?? 0,
      id: map['id'] ?? '',
      visibleIf: map['visibleIf'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelPreIterationItem.fromJson(String source) =>
      ModelPreIterationItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ModelPreIterationItem(text: $text, type: $type, order: $order, id: $id, visibleIf: $visibleIf)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelPreIterationItem &&
        other.text == text &&
        other.type == type &&
        other.order == order &&
        other.id == id &&
        other.visibleIf == visibleIf;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        type.hashCode ^
        order.hashCode ^
        id.hashCode ^
        visibleIf.hashCode;
  }
}
