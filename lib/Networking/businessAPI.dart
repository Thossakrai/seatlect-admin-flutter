import 'package:http/http.dart' as http;

class BusinessAPI {
  String devServer = 'localhost:9999';
  String commonEndpoint = '/api/v1/business';
  Future<http.Response> listBusiness(int status, int page) async {
    Map<String, String> queryParams = {
      'status': status.toString(),
      'page': page.toString()
    };

    var response =
        await http.get(Uri.http(devServer, commonEndpoint, queryParams));
    return response;
  }

  Future<http.Response> getBusiness(String businessId) async {
    var response =
        await http.get(Uri.http(devServer, commonEndpoint + '$businessId'));
    return response;
  }

  void updateBusiness(String businessId) {}
}
