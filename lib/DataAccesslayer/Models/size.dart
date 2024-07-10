import 'dart:convert';

class Size {
  final int id;
  final String cm;
  final String inches;
  final String type;
  final String createdAt;

  Size({
    required this.id,
    required this.cm,
    required this.inches,
    required this.type,
    required this.createdAt,
  });

  factory Size.fromMap(Map<String, dynamic> map) {
    return Size(
      id: map['id'] as int,
      cm: map['cm'] ?? "",
      inches: map['inches'] ?? "",
      type: map['type'] ?? "",
      createdAt: map['created_at'] ?? "",
    );
  }

  factory Size.fromJson(String source) =>
      Size.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cm': cm,
      'inches': inches,
      'type': type,
      'created_at': createdAt,
    };
  }
}
