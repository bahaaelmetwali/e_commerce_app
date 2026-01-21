
abstract class ApiHelper {
  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) ;

   Future<Map<String, dynamic>> post({
    required String endPoint,
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? formData,
    final Map<String, dynamic>? json,
  });

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
