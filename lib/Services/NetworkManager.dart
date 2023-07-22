import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkManager {
  final String baseUrl;

  NetworkManager(this.baseUrl);

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));

    if (response.statusCode == 200) {
      // Başarıyla veri alındıysa, gelen JSON verisini dönüştürüp Category listesi olarak döndürüyoruz.
      List<dynamic> jsonData = json.decode(response.body);
      List<Category> categories =
          jsonData.map((json) => Category.fromJson(json)).toList();
      return categories;
    } else {
      // Hata durumunda boş bir liste döndürüyoruz.
      return [];
    }
  }
}

class Category {
  final int id;
  final String name;
  // Diğer kategori özelliklerini buraya ekleyebilirsiniz.

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      // Diğer kategori özelliklerini JSON'dan çıkarmak için buraya ekleyebilirsiniz.
    );
  }
}
