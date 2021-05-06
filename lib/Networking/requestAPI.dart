import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'networking.dart';

class RequestAPI {
  Future<http.Response> listRequest(int status, int page) async {
    Map<String, String> queryParams = {
      'status': status.toString(),
      'page': page.toString(),
    };

    var response = await http
        .get(Uri.http('localhost:9999', '/api/v1/business', queryParams));
    if (response.statusCode == 200) {
      print('Business API 200');
    } else {
      print('40x');
    }
    return response;
  }

  void approveRequest(String businessId) {

  }

  void rejectRequest(String businessId) {

  }

  Future<http.Response> getRequest(int status, int page) async {

  }
}
