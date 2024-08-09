import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:store/Features/cart/cubit/cubit/cart_state.dart';
import 'package:store/Features/cart/data/model/cart_model.dart';

class CartCubit extends Cubit<CartState> {
  final Dio _dio = Dio();

  CartCubit() : super(CartInitial());

  // Fetch cart for a specific user
  Future<void> getCart(int userId) async {
  try {
    final response = await _dio.get('https://fakestoreapi.com/carts/$userId');

    if (response.statusCode == 200) {
      final cartData = response.data;
      final cart = Cart.fromJson(cartData);
      emit(CartLoaded(cart));
    } else {
      emit(CartError('Failed to load cart data'));
    }
  } catch (e) {
    emit(CartError('Error loading cart data: ${e.toString()}'));
  }
}


  // Add item to cart
Future<void> addCart(Cart cartItem) async {
  try {
    final response = await _dio.post(
      'https://fakestoreapi.com/carts',
      data: {
        'userId': cartItem.id,
        'date': cartItem.date,
        'products': cartItem.products?.map((p) => {
              'productId': p.productId,
              'quantity': p.quantity,
            }).toList(),
      },
    );

    if (response.statusCode == 200) {
      emit(CartSuccess());
      // Re-fetch the cart data to ensure it's up-to-date
      getCart(cartItem.id ?? 1);  
    } else {
      emit(CartError('Failed to add item to cart'));
    }
  } catch (e) {
    emit(CartError('Failed to add item to cart'));
  }
}

Future<void> getCartTest(int userId) async {
  try {
    // Replace this with actual API call
    final cart = Cart(
      id: 1,
      date: "2023-12-01",
      products: [
        Products(productId: 1, quantity: 2),
        Products(productId: 2, quantity: 3),
      ],
    );
    emit(CartLoaded(cart));
  } catch (e) {
    emit(CartError('Error loading cart data: ${e.toString()}'));
  }
}


}
