import 'package:dio/dio.dart';
import '../model/add_card_model.dart';

class AddCardWebServices {
  final Dio dio;

  AddCardWebServices({required String baseUrl})
      : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            receiveDataWhenStatusError: true,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );

  Future<Map<String, dynamic>> addCard(AddCard card) async {
    try {
      Response response = await dio.post(
        'carts', // Your endpoint here
        data: card.toJson(),
      );
      return response.data;
    } catch (e) {
      print('Error: $e');
      return {};
    }
  }

  Future<Map<String, dynamic>> getCard(int id) async {
    try {
      Response response = await dio.get('carts/$id'); // Endpoint for fetching by ID
      return response.data;
    } catch (e) {
      print('Error: $e');
      return {};
    }
  }
}
