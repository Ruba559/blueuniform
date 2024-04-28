import 'dart:convert';

class Semester {
  final int id;
  final String name;
  final String createdAt;
 
  Semester({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory Semester.fromMap(Map<String, dynamic> map) {
    return Semester(
        id: map['id'] as int,
        name: map['name'] ?? "",
        createdAt: map['created_at'] ?? "",
        );
  }
  

  factory Semester.fromJson(String source) =>
      Semester.fromMap(json.decode(source) as Map<String, dynamic>);



 Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'created_at' : createdAt,
    
    };
  }

}
