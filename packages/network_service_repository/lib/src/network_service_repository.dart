import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkService {
  NetworkService({Dio? dio})
      : _dio = dio ?? Dio(BaseOptions(baseUrl: _baseUrl));

  final Dio _dio;

  static const _baseUrl = 'https://weatherdbi.herokuapp.com';

  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      return await _dio.get(url,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
          ));
    } on DioError catch (error) {
      debugPrint(error.response?.statusCode.toString());
      throw Exception();
    }
  }

  Future<Response> delete(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      return await _dio.delete(url,
          queryParameters: queryParameters, options: Options(headers: headers));
    } on DioError catch (error) {
      debugPrint(error.response?.statusCode.toString());
      throw Exception();
    }
  }

  Future<Response> post(String url,
      {Map<String, dynamic>? queryParameters,
      data,
      Map<String, dynamic>? headers}) async {
    try {
      return await _dio.post(url,
          queryParameters: queryParameters,
          data: data,
          options: Options(headers: headers));
    } on DioError catch (error) {
      debugPrint(error.response?.statusCode.toString());
      throw Exception();
    }
  }

  Future<Response> put(String url,
      {Map<String, dynamic>? queryParameters,
      data,
      Map<String, dynamic>? headers}) async {
    try {
      return await _dio.put(url,
          queryParameters: queryParameters,
          data: data,
          options: Options(headers: headers));
    } on DioError catch (error) {
      debugPrint(error.response?.statusCode.toString());
      throw Exception();
    }
  }

  Future<Response> uploadFile(String url,
      {Map<String, dynamic>? queryParameters,
      required FormData formData,
      Map<String, dynamic>? headers}) async {
    try {
      return await _dio.post(url,
          queryParameters: queryParameters,
          data: formData,
          options: Options(headers: headers));
    } on DioError catch (error) {
      debugPrint(error.response?.statusCode.toString());
      throw Exception();
    }
  }
}
