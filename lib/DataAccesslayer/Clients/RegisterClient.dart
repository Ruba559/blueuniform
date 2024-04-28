import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api.dart';

class RegisterClient {
  var client = http.Client();

  RegisterClient();

  Future<dynamic> getSchools() async {
    var response = await client.get(Uri.parse(baseUrl + schools));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

  Future<dynamic> getCities() async {
    var response = await client.get(Uri.parse(baseUrl + cities));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

  Future<dynamic> getClasses() async {
    var response = await client.get(Uri.parse(baseUrl + classes));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

  Future<dynamic> getBranches() async {
    var response = await client.get(Uri.parse(baseUrl + branches));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

  Future<dynamic> getSections() async {
    var response = await client.get(Uri.parse(baseUrl + sections));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

  Future<dynamic> getStages() async {
    var response = await client.get(Uri.parse(baseUrl + stages));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

  Future<dynamic> getSemesters() async {
    var response = await client.get(Uri.parse(baseUrl + semesters));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

  Future<dynamic> Register(email, password, studentName, school_id, city_id,
      section_id, classe_id, stage_id, semester_id, branch_id) async {
    var url = Uri.parse(baseUrl + register);

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'studentName': studentName,
        'email': email,
        'password': password,
        'school_id': school_id,
        'city_id': city_id,
        'section_id': section_id,
        'classe_id': classe_id,
        'stage_id': stage_id,
        'semester_id': semester_id,
        'branch_id': branch_id,
      }),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }
}
