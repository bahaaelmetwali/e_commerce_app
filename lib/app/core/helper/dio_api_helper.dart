import 'package:dio/dio.dart';

import 'api_helper.dart';

class DioApiHelper implements ApiHelper {
  final Dio dio;

  DioApiHelper(this.dio);

  @override
  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    final response = await dio.get(endPoint, queryParameters: query);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    final response = await dio.post(endPoint, data: body);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> put({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    final response = await dio.put(endPoint, data: body);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> delete({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    final response = await dio.delete(endPoint, queryParameters: query);
    return response.data;
  }
}
