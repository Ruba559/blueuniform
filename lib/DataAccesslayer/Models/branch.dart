import 'dart:convert';

class Branch {
  final int id;
  final String name;
  final String createdAt;
 
  Branch({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory Branch.fromMap(Map<String, dynamic> map) {
    return Branch(
        id: map['id'] as int,
        name: map['name'] ?? "",
        createdAt: map['created_at'] ?? "",
        );
  }
  

  factory Branch.fromJson(String source) =>
      Branch.fromMap(json.decode(source) as Map<String, dynamic>);



 Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'created_at' : createdAt,
    
    };
  }

}
