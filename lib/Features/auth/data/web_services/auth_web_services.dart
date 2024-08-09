import 'package:dio/dio.dart';
class AuthWebServices {
  final Dio dio;

  AuthWebServices({required String baseUrl})
      : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            receiveDataWhenStatusError: true,
            validateStatus: (status) {
              return status! < 500;
            },
            connectTimeout: const Duration(seconds: 60),
            receiveTimeout: const Duration(seconds: 60),
          ),
        );

Future<Map<String, dynamic>> login(String username, String password) async {
  try {
    Response response = await dio.post(
      'auth/login',
      data: {
        'username': username,
        'password': password,
      },
    );
    return response.data;
  } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionError) {
      print('Connection error occurred: ${e.message}');
      // Additional diagnostics
      print('Error details: ${e.response?.toString() ?? 'No response details available'}');
    } else if (e.type == DioExceptionType.receiveTimeout) {
      print('Receive timeout occurred: ${e.message}');
    } else {
      print('Other DioException occurred: ${e.message}');
    }
    return {};
  } catch (e) {
    print('Unexpected error occurred: $e');
    return {};
  }
}


}
