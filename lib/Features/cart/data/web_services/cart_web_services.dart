import 'package:dio/dio.dart';
import 'package:store/Features/cart/data/model/cart_model.dart';

class CartWebServices {
  final Dio dio;

  CartWebServices({required String baseUrl})
      : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            receiveDataWhenStatusError: true,
            validateStatus: (status) => status! < 500,
            connectTimeout: const Duration(seconds: 40),
            receiveTimeout: const Duration(seconds: 40),
          ),
        );

  Future<Map<String, dynamic>> addCart(Cart cart) async {
    try {
      Response response = await dio.post(
        'cart',
        data: cart.toJson(),
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      print('Error: $e');
      return {};
    }
  }

  Future<Map<String, dynamic>> getCart(int userId) async {
    try {
      Response response = await dio.post(
        'cart',
        data: {'userId': userId},
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      if (e.response != null) {
        // Error response from server
        print('Server error: ${e.response?.data}');
      } else {
        // Error not related to the response
        print('Network error: ${e.message}');
      }
      return {};
    } catch (e) {
      print('Unexpected error: $e');
      return {};
    }
  }
}
