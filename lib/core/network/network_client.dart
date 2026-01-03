import 'dart:io';
import 'package:dio/dio.dart';
import 'package:enterprise/core/error/exception.dart';

class NetworkClient {
  final Dio dio;
  NetworkClient({required this.dio});

  Future<Response> invoke(
    String url,
    RequestType requestType, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic requestBody,
  }) async {
    Response response;
    try {
      switch (requestType) {
        case RequestType.get:
          response = await dio.get(
            url,
            queryParameters: queryParameters,
            options: Options(responseType: ResponseType.json),
          );
          break;
        case RequestType.post:
          response = await dio.post(
            url,
            data: requestBody,
            queryParameters: queryParameters,
            options: Options(responseType: ResponseType.json),
          );
          break;
        case RequestType.put:
          response = await dio.put(
            url,
            data: requestBody,
            queryParameters: queryParameters,
            options: Options(responseType: ResponseType.json),
          );
          break;
        case RequestType.patch:
          response = await dio.patch(
            url,
            data: requestBody,
            queryParameters: queryParameters,
            options: Options(responseType: ResponseType.json),
          );
          break;
        case RequestType.delete:
          response = await dio.delete(
            url,
            queryParameters: queryParameters,
            data: requestBody,
            options: Options(responseType: ResponseType.json),
          );
          break;
      }
      return response;
    } on DioException catch (e) {
      throw ServerException(dioException: e);
    } on SocketException {
      rethrow;
    }
  }
}

enum RequestType { get, post, put, delete, patch }
