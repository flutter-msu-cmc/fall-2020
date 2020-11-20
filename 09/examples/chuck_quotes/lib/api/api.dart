import 'package:dio/dio.dart';

class ApiProvider {
  static Dio dio = Dio();
  static String _baseUrl = 'https://api.chucknorris.io/';

  Future<Response> get(String url) async {
    try {
      final response = await dio.get(_baseUrl + url);
      return response;
    } catch (e) {
      print('Some error');
      return null;
    }
  }
}
