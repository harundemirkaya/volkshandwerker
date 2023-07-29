import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:volkshandwerker/Models/Branches.dart';
import 'package:volkshandwerker/Models/Categories.dart';
import 'package:volkshandwerker/Models/LoginResponse.dart';
import 'package:volkshandwerker/Models/RegisterResponse.dart';

class NetworkManager {
  final String baseUrl;

  NetworkManager(this.baseUrl);

  Future<List<Categories>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      List<Categories> categories =
          jsonData.map((json) => Categories.fromJson(json)).toList();
      return categories;
    } else {
      return [];
    }
  }

  Future<List<BranchModel>> fetchBranches(String name, int categoryId) async {
    // encode
    final name0 = Uri.encodeComponent(name);

    final response = await http.get(Uri.parse(
        '$baseUrl/branches?location=$name0&company.categories_in=$categoryId'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      List<BranchModel> branches =
          jsonData.map((json) => BranchModel.fromJson(json)).toList();
      print(branches);
      return branches;
    } else {
      return [];
    }
}
 
  Future<LoginResponse?> loginRequest(String email, String password) async {
    var body = {'identifier': email, 'password': password};
    final response = await http.post(
      Uri.parse('$baseUrl/auth/local'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(jsonData);
      return loginResponse;
    } else {
      return null;
    }
  }

  Future<RegisterResponse?> registerRequest(
      String username, String email, String password) async {
    var body = {"username": username, 'email': email, 'password': password};
    final response = await http.post(
      Uri.parse('$baseUrl/auth/local/register'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      RegisterResponse registerResponse = RegisterResponse.fromJson(jsonData);
      return registerResponse;
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  }
}
