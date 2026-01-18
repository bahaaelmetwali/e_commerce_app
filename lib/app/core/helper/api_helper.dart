


abstract class ApiHelper {
  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? query,
  });

  Future<Map<String, dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? body,
  });

  Future<Map<String, dynamic>> put({
    required String endPoint,
    Map<String, dynamic>? body,
  });

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    Map<String, dynamic>? query,
  });
}