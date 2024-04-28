import 'dart:convert';

class School {
  final int id;
  final String name;
  final String createdAt;
 
  School({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory School.fromMap(Map<String, dynamic> map) {
    return School(
        id: map['id'] as int,
        name: map['name'] ?? "",
        createdAt: map['created_at'] ?? "",
        );
  }
  

  factory School.fromJson(String source) =>
      School.fromMap(json.decode(source) as Map<String, dynamic>);



 Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'created_at' : createdAt,
    
    };
  }

}
