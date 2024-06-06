import 'package:dio/dio.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';

class DioHelper {
  static final _dio = Dio(BaseOptions(
    baseUrl: "https://thimar.amr.aait-d.com/api/",
    headers: {
      'Authorization': 'Bearer${CacheHelper.token}',
     "Accept": "application/json",
    },
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
  ));

  static Future<CustomResponse> send(String path,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return CustomResponse(
          isSuccess: true,
          data: response.data,
          statusCode: response.statusCode);
    } on DioException catch (ex) {
      return CustomResponse(
        isSuccess: false,
        data: ex.response?.data,
        statusCode: ex.response?.statusCode,
        msg: ex.response?.data["message"],
      );
    }
  }

  static Future<CustomResponse> get(String path,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.get(path, queryParameters: data);
      return CustomResponse(
          isSuccess: true,
          data: response.data,
          statusCode: response.statusCode);
    } on DioException catch (ex) {
      return CustomResponse(
          isSuccess: false,
          data: ex.response?.data,
          statusCode: ex.response?.statusCode,
          msg: ex.error.toString());
    }
  }
  static Future<CustomResponse> put(String path,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.put(path, queryParameters: data);
      return CustomResponse(
          isSuccess: true,
          data: response.data,
          statusCode: response.statusCode);
    } on DioException catch (ex) {
      return CustomResponse(
          isSuccess: false,
          data: ex.response?.data,
          statusCode: ex.response?.statusCode,
          msg: ex.error.toString());
    }
  }
  static Future<CustomResponse> delete(String path,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.delete(path, queryParameters: data);
      return CustomResponse(
          isSuccess: true,
          data: response.data,
          statusCode: response.statusCode);
    } on DioException catch (ex) {
      return CustomResponse(
          isSuccess: false,
          data: ex.response?.data,
          statusCode: ex.response?.statusCode,
          msg: ex.error.toString());
    }
  }
}

class CustomResponse {
  final String msg;
  final bool isSuccess;
  final data;
  final int? statusCode;

  CustomResponse({
    this.statusCode,
    required this.isSuccess,
    this.data,
    this.msg = '',
  });
}
