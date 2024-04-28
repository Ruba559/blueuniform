import 'dart:convert';

class User {
  final int id;
  final String studentName;
  final String email;
  final String image;
  final int school_id;
  final int city_id;
  final int section_id;
  final int classe_id;
  final int stage_id;
  final int semester_id;
  final int branch_id;

  final String createdAt;

  User({
    required this.id,
    required this.studentName,
    required this.email,
    required this.image,
    required this.school_id,
    required this.city_id,
    required this.section_id,
    required this.classe_id,
    required this.stage_id,
    required this.semester_id,
    required this.branch_id,
    required this.createdAt,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      studentName: map['studentName'] ?? "",
      email: map['email'] ?? "",
      image: map['image'] ?? "",
      school_id: map['school_id'] ,
      city_id: map['city_id'] ,
      section_id: map['section_id'] ,
      classe_id: map['classe_id'] ,
      stage_id: map['stage_id'],
      semester_id: map['semester_id'],
      branch_id: map['branch_id'] ,
      createdAt: map['created_at'] ?? "",
    );
  }

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  toJson() {}
}
