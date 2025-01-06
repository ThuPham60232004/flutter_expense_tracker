import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_expense_tracker/data/models/user.dart';

class AuthRepository {
  final String apiUrl = 'http://localhost:2000/user';

  Future<User?> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('Login error');
    }
  }

  Future<User?> registerUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('Registration error');
    }
  }
}
