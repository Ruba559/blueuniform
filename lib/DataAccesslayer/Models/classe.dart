import 'dart:convert';

class Classe {
  final int id;
  final String name;
  final String createdAt;
 
  Classe({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory Classe.fromMap(Map<String, dynamic> map) {
    return Classe(
        id: map['id'] as int,
        name: map['name'] ?? "",
        createdAt: map['created_at'] ?? "",
        );
  }
  

  factory Classe.fromJson(String source) =>
      Classe.fromMap(json.decode(source) as Map<String, dynamic>);



 Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'created_at' : createdAt,
    
    };
  }

}
