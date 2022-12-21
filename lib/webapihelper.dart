// ignore_for_file: unused_field, prefer_const_declarations

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:w12_biruni_flutterapp/student.dart';

class WebApiHelper {
  static final String _baseUrl = "https://apiservice.biruni.edu.tr/api";
  static final _client = Dio();

  static Future<Student> getStudent(int id) async {
    var action = "Students/get";
    var fullUrl = "${_baseUrl}/${action}/$id";

    var response = await _client.get(fullUrl);
    var data = response.data;

    return Student.fromJson({
      "id": data["id"],
      "firstName": data["firstName"],
      "lastName": data["lastName"],
      "age": data["age"],
    });
  }

  static Future<List<Student>> getStudentList() async {
    var action = "Students/getList";
    var fullUrl = "${_baseUrl}/${action}";

    var response = await _client.get(fullUrl);
    var data = response.data as List;

    var res = data.map((jsonObject) {
      return Student.fromJson({
        "id": jsonObject["id"],
        "firstName": jsonObject["firstName"],
        "lastName": jsonObject["lastName"],
        "age": jsonObject["age"],
      });
    }).toList();

    return res;
  }

  static Future<String> insertStudent(Student student) async {
    var action = "Students/insert";
    var fullUrl = "${_baseUrl}/${action}";

    var response = await _client.post(fullUrl, data: student.toJson());

    return "Insert Success";
  }

  static Future<String> updateStudent(Student student) async {
    var action = "Students/update";
    var fullUrl = "${_baseUrl}/${action}";

    var response = await _client.put(fullUrl, data: student.toJson());

    return "Insert Update";
  }

    static Future<String> deleteStudent(Student student) async {
    var action = "Students/delete";
    var fullUrl = "${_baseUrl}/${action}";

    var response = await _client.delete(fullUrl, data: student.toJson());

    return "Delete Update";
  }
}
