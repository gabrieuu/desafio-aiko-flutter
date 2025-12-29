abstract class IHttpClient {
  Future<Object> get(String path, {Map<String, String>? headers, Map<String, dynamic>? queryParameters});
  Future<Object> post(String path, {Map<String, String>? headers, Map<String, dynamic>? body});
  Future<Object> put(String path, {Map<String, String>? headers, Map<String, dynamic>? body});
  Future<Object> delete(String path, {Map<String, String>? headers, Map<String, dynamic>? body});
}