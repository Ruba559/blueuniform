// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BackNotification {
  final int id;
  final String title;
   final String subtitle;
   final String type;
      final String payload;
       final String createdAt;
  BackNotification({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.payload,
    required this.createdAt,
  });
      
   

  BackNotification copyWith({
    int? id,
    String? title,
    String? subtitle,
    String? type,
    String? payload,
    String? createdAt,
  }) {
    return BackNotification(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      type: type ?? this.type,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'type': type,
      'payload': payload,
      'createdAt': createdAt,
    };
  }

  factory BackNotification.fromMap(Map<String, dynamic> map) {
    return BackNotification(
      id: map['id'] as int,
      title: map['title'] .toString(),
      subtitle: map['subtitle'] .toString(),
      type: map['type'].toString(),
      payload: map['payload'].toString(),
      createdAt: map['created_at'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory BackNotification.fromJson(String source) => BackNotification.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Notifications(id: $id, title: $title, subtitle: $subtitle, type: $type, payload: $payload, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant BackNotification other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.subtitle == subtitle &&
      other.type == type &&
      other.payload == payload &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      subtitle.hashCode ^
      type.hashCode ^
      payload.hashCode ^
      createdAt.hashCode;
  }
}
