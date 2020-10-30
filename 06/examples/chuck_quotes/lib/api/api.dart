import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiProvider {
  static String _baseUrl = 'https://api.chucknorris.io/';

  Future<dynamic> get(String url) async {
    dynamic json;
    try {
      final response = await http.get(_baseUrl + url);
      json = _response(response);
    } catch (e) {
      print('Some error');
    }
    return json;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw (Exception('Some network error'));
    }
  }
}
