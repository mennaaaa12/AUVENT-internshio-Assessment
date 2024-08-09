import 'package:dio/dio.dart';

class ProductWebServices {
  final Dio dio;

  ProductWebServices({required String baseUrl})
      : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            receiveDataWhenStatusError: true,
             validateStatus: (status) {
    return status! < 500; 
  },
            connectTimeout: const Duration(seconds: 40),
            receiveTimeout: const Duration(seconds: 40),
          ),
        );

  Future<List<dynamic>> getAllProducts() async {
    try {
      Response response = await dio.get('products');
      return response.data;  
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
