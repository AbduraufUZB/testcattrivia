import 'package:dio/dio.dart';

class ApiService {
  static final ApiService _instance = ApiService._init();
  static ApiService get instance => _instance;
  ApiService._init();
  final String _baseUrl = "https://cat-fact.herokuapp.com";
  Future<Response>? getDatas() async {
    try {
      Response res = await Dio().get("$_baseUrl/facts/random?animal_type=cat");
      return res;
    } catch (e) {
      throw e;
    }
  }
}
