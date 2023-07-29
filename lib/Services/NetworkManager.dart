import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:volkshandwerker/Models/Categories.dart';

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
}
