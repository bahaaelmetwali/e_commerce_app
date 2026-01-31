
import 'package:dio/dio.dart';

abstract class ApiHelper {
  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) ;

Future<Map<String, dynamic>> post({
  required String endPoint,
  Map<String, dynamic>? queryParameters,
  Map<String, dynamic>? json,
  FormData? formData, 
})  ;
  Future<Map<String, dynamic>> put({
    required String endPoint,
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? formData,
    final Map<String, dynamic>? json,
  }) ;

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  });
}
