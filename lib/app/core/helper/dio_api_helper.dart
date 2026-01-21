import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'api_helper.dart';

@Singleton(as: ApiHelper)
class DioApiHelper implements ApiHelper {
  final Dio dio;

  DioApiHelper(this.dio);

  @override
  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get(endPoint, queryParameters: queryParameters);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post({
    required String endPoint,
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? formData,
    final Map<String, dynamic>? json,
  }) async {
    Object? body= json;
    if (formData != null) {
      body = FormData.fromMap(formData);
    }
    final response = await dio.post(
      endPoint,
      data: body,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> put({
    required String endPoint,
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? formData,
    final Map<String, dynamic>? json,
  }) async {
      Object? body= json;
    if (formData != null) {
      body = FormData.fromMap(formData);
    }
    final response = await dio.put(endPoint, data: body);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> delete({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.delete(endPoint, queryParameters: queryParameters);
    return response.data;
  }
}
