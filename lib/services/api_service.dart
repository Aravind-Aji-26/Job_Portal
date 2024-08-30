import 'package:dio/dio.dart';

class APIService {
  final Dio _dio = Dio();

  APIService() {
    _configureDio();
  }

  void _configureDio() {
    _dio.options = BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/albums/1/",
    );
  }

  Future<List<dynamic>> get(String path) async {
    try {
      Response response = await _dio.get(path);
      return response.data;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
