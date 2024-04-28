import 'dart:convert';

class Section {
  final int id;
  final String name;
  final String createdAt;
 
  Section({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
        id: map['id'] as int,
        name: map['name'] ?? "",
        createdAt: map['created_at'] ?? "",
        );
  }
  

  factory Section.fromJson(String source) =>
      Section.fromMap(json.decode(source) as Map<String, dynamic>);



 Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'created_at' : createdAt,
    
    };
  }

}
