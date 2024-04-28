import 'dart:convert';

class Stage {
  final int id;
  final String name;
  final String createdAt;
 
  Stage({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory Stage.fromMap(Map<String, dynamic> map) {
    return Stage(
        id: map['id'] as int,
        name: map['name'] ?? "",
        createdAt: map['created_at'] ?? "",
        );
  }
  

  factory Stage.fromJson(String source) =>
      Stage.fromMap(json.decode(source) as Map<String, dynamic>);



 Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'created_at' : createdAt,
    
    };
  }

}
