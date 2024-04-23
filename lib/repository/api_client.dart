import 'package:dio/dio.dart';

import 'api_constants.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({
    String? baseUrl,
    ResponseType responseType = ResponseType.json,
  }) : _dio = Dio(BaseOptions(
          baseUrl: baseUrl ?? ApiConstants.baseUrl,
          responseType: responseType,
        ));

  Future<T?> get<T>({
    required String path,
    Map<String, dynamic> queryParameters = const {},
  }) async {
    final response = await _dio.get<T>(
      path,
      queryParameters: {
        'key': ApiConstants.apiKey,
        ...queryParameters,
      },
    );
    return response.data;
  }
}
