import 'dart:convert';

import '../Clients/RegisterClient.dart';
import '../Models/branch.dart';
import '../Models/city.dart';
import '../Models/classe.dart';
import '../Models/school.dart';
import '../Models/section.dart';
import '../Models/semester.dart';
import '../Models/stage.dart';
import '../Models/user.dart';

class RegisterRepo {
  RegisterClient client = RegisterClient();

  Future<List<School>> getSchools() async {
    var response = await client.getSchools();
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<School>((json) => School.fromMap(json)).toList();
    }
    return [];
  }

  Future<List<City>> getCities() async {
    var response = await client.getCities();
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<City>((json) => City.fromMap(json)).toList();
    }
    return [];
  }

  Future<List<Classe>> getClasses() async {
    var response = await client.getClasses();
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Classe>((json) => Classe.fromMap(json)).toList();
    }
    return [];
  }

  Future<List<Branch>> getBranches() async {
    var response = await client.getBranches();
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Branch>((json) => Branch.fromMap(json)).toList();
    }
    return [];
  }

  Future<List<Section>> getSections() async {
    var response = await client.getSections();
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Section>((json) => Section.fromMap(json)).toList();
    }
    return [];
  }

  Future<List<Stage>> getStages() async {
    var response = await client.getStages();
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Stage>((json) => Stage.fromMap(json)).toList();
    }
    return [];
  }

  Future<List<Semester>> getSemesters() async {
    var response = await client.getSemesters();
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Semester>((json) => Semester.fromMap(json)).toList();
    }
    return [];
  }

  Future<dynamic> register(email, password, studentName, school_id, city_id,
      section_id, classe_id, stage_id, semester_id, branch_id) async {
    // if (await client.Register(email, password, studentName, school_id, city_id,
    //         section_id, classe_id, stage_id, semester_id, branch_id) !=
    //     '') {
      var response = await client.Register(
          email,
          password,
          studentName,
          school_id,
          city_id,
          section_id,
          classe_id,
          stage_id,
          semester_id,
          branch_id);
             print('hihi');
      print( User.fromJson(response));
      return User.fromJson(response);
    // } else {
    //   return '';
    // }
  }
}
