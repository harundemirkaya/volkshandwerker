import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:volkshandwerker/Models/AppleModel.dart';
import 'package:volkshandwerker/Models/ApplePay.dart';
import 'package:volkshandwerker/Models/ApplePayPrice.dart';
import 'package:volkshandwerker/Models/Branches.dart';
import 'package:volkshandwerker/Models/Categories.dart';
import 'package:volkshandwerker/Models/LoginResponse.dart';
import 'package:volkshandwerker/Models/Payment.dart';
import 'package:volkshandwerker/Models/RegisterResponse.dart';
import 'package:volkshandwerker/Helpers/UserToken.dart';
import 'package:volkshandwerker/Models/SubscriberResponse.dart';

import '../Models/User.dart';

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
        '$baseUrl/branches?location=$name0${categoryId != 0 ? '&company.categories_in=$categoryId' : ''}'));

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
      print("Login Success! Token: ${loginResponse.jwt}");

      await UserToken.setToken(loginResponse.jwt);
      return loginResponse;
    } else {
      print("Login Failed.");
      print('Status Code: ${response.statusCode}');
      print("Response: ${response.body}");
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
      print("Register Success!");
      return registerResponse;
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  }

  Future<User?> userControl(String token) async {
    final response = await http.get(Uri.parse('$baseUrl/users/me'),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      User userModel = User.fromJson(jsonData);
      return userModel;
    } else {
      return null;
    }
  }

  Future<Subscriber?> updateSubscriber(
      SubscriberUpdate data, dynamic userId) async {
    final url = Uri.parse('$baseUrl/subscribers/$userId');
    var token = await UserToken.getToken();

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${token}'
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        Subscriber subscriberResponse = Subscriber.fromJson(jsonData);
        return subscriberResponse;
      } else {
        return null;
      }
    } catch (e) {
      print('Error occurred while sending data to the API: $e');
      // Handle the exception if needed
    }
  }

  Future<AppPaymentResponse> paymentRequest(dynamic data) {
    final url = Uri.parse('https://pay.volkshandwerker.de:2096/pay/subscribe');
    return http.post(url, body: data).then((http.Response response) {
      final int statusCode = response.statusCode;
      if (statusCode != 200) {
        print('Error while fetching data');
        return AppPaymentResponse.fromJson(json.decode(response.body));
      }
      return AppPaymentResponse.fromJson(json.decode(response.body));
    });
  }

  Future<ApplePayConfiguration> applePayConfiguration() async {
    final response = await http
        .get(Uri.parse('https://pay.volkshandwerker.de:2096/pay/appleinfo'));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      ApplePayConfiguration applePayConfiguration =
          ApplePayConfiguration.fromJson(jsonData);
      return applePayConfiguration;
    } else {
      throw Exception('Failed to load payment info');
    }
  }

  Future<String> applePayConfigurationString() async {
    final response = await http
        .get(Uri.parse('https://pay.volkshandwerker.de:2096/pay/appleinfo'));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      ApplePayConfiguration applePayConfiguration =
          ApplePayConfiguration.fromJson(jsonData);
      return jsonEncode(applePayConfiguration);
    } else {
      throw Exception('Failed to load payment info');
    }
  }

  Future<ApplePayPrice> applePayPrice() async {
    final response = await http
        .get(Uri.parse('https://pay.volkshandwerker.de:2096/pay/appleprice'));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      ApplePayPrice applePayPrice = ApplePayPrice.fromJson(jsonData);
      return applePayPrice;
    } else {
      throw Exception('Failed to load payment info');
    }
  }

  Future<AppleModel> applePayConfig() async {
    final response = await http
        .get(Uri.parse('https://pay.volkshandwerker.de:2096/pay/appleinfo'));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      AppleModel applePayConfig = AppleModel.fromJson(jsonData);
      return applePayConfig;
    } else {
      throw Exception('Failed to load payment info');
    }
  }

  Future<dynamic> makeApplePayPayment(dynamic data) async {
    final url = Uri.parse('https://pay.volkshandwerker.de:2096/pay/applepay');
    return http.post(url, body: data).then((http.Response response) {
      final int statusCode = response.statusCode;
      if (statusCode != 200) {
        print('Error while fetching data');
        return json.decode(response.body);
      }
      return json.decode(response.body);
    });
  }
}
