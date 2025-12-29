import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:solucao/infra/i_http_client.dart';
import 'package:solucao/utils/environments.dart';

class DioClient implements IHttpClient {
  late Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        queryParameters: {
          'token' : '0baba2bc1968a5f28da76fcee81b9602047ca20f3d92588a5583c74fa5a815d3'
        },
        headers: {
          'Content-Type': 'application/json',
          'token': '0baba2bc1968a5f28da76fcee81b9602047ca20f3d92588a5583c74fa5a815d3',
        },
        responseType: ResponseType.json,
      ),
    );
    var cookieJar = CookieJar();

    dio.interceptors.add(
      CookieManager(cookieJar)
    );
  }
  
  @override
  Future<Object> delete(String path, {Map<String, String>? headers, Map<String, dynamic>? body}) async{
    var response = await dio
        .delete(
          path,
          options: Options(
            headers: headers,
          ),
          data: body,
        );
    return response.data;
  }
  
  @override
  Future<Map<String, dynamic>> get(String path, {Map<String, String>? headers, Map<String, dynamic>? queryParameters}) async{
    var response = await dio
        .get(
          path,
          options: Options(
            headers: headers,
          ),
          queryParameters: queryParameters,
        );
    return response.data;
  }
  
  @override
  Future<Object> post(String path, {Map<String, String>? headers, Map<String, dynamic>? body}) async{
    var response = await dio
        .post(
          path,
          options: Options(
            headers: headers,
          ),
          data: body,
        );
    return response.data;
  }
  
  @override
  Future<Object> put(String path, {Map<String, String>? headers, Map<String, dynamic>? body}) async{
    var response = await dio
        .put(
          path,
          options: Options(
            headers: headers,
          ),
          data: body,
        );
    return response.data;
  }

}