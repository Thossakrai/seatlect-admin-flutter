import 'dart:async';
import 'package:http/http.dart' as http;

class RequestAPI {
  String devServer = 'localhost:9999';
  String commonEndpoint = '/api/v1/request';
  Future<http.Response> listRequest(int page) async {
    Map<String, String> queryParams = {
      'page': page.toString(),
    };

    var response =
        await http.get(Uri.http(devServer, commonEndpoint, queryParams));
    if (response.statusCode == 200) {
      print('Request API 200');
    } else {
      print('40x');
    }
    return response;
  }

  void approveRequest(String requestId) {
    http.post(Uri.http(
      devServer,
      commonEndpoint + '/$requestId/approve',
    ));
  }

  void rejectRequest(String requestId) {
    http.delete(Uri.http(
      devServer,
      commonEndpoint + '/$requestId',
    ));
  }

  Future<http.Response> getRequest(String requestId) async {
    var response =
        await http.get(Uri.http(devServer, commonEndpoint + '/$requestId'));
    if (response.statusCode >= 400) {
      print('get request 40x');
    } else if (response.statusCode >= 200) {
      print('get request 20x 30x');
    }
    return response;
  }
}
