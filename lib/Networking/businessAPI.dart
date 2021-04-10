import 'dart:convert';
import 'package:http/http.dart' as http;
import 'networking.dart';

class BusinessAPI {
  Future<http.Response> getBusiness(int status, int page) async {
    Map<String, String> queryParams = {
      'status': status.toString(),
      'page': page.toString(),
    };

    var response = await http
        .get(Uri.http('localhost:9999', '/api/v1/business', queryParams));
    if (response.statusCode == 200) {
      print('200');
    } else {
      print('40x');
    }
    return response;
  }
}
