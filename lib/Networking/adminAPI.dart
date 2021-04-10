import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seatlect_admin/Networking/networking.dart';

class AdminAPI {
  Future<http.Response> login(String username, String password) async {
    var response = await http.post(
        Uri.http('localhost:9999', "/api/v1/admin/login"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(
            <String, String>{"username": username, "password": password}));
    if (response.statusCode >= 200) {
      print("Amdin API 200");
    } else {
      print("40x");
    }
    return response;
  }
}
