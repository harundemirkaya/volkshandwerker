import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:volkshandwerker/Models/Categories.dart';
import 'package:volkshandwerker/Models/LoginResponse.dart';

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
}
