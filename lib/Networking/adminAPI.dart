import 'dart:convert';

import 'package:http/http.dart' as http;

class AdminAPI {
  Future<http.Response> login(String username, String password) async {
    var response = await http.post(
        Uri.http('localhost:9999', "/api/v1/admin/login"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(
            <String, String>{"username": username, "password": password}));
    if (response.statusCode >= 400) {
      print("Admin API 40x");
    } else if (response.statusCode >= 200) {
      print("20x");
    }
    return response;
  }
}
