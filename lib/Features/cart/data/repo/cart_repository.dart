import 'package:store/Features/cart/data/model/cart_model.dart';
import 'package:store/Features/cart/data/web_services/cart_web_services.dart';

class CartRepository {
  final CartWebServices cartWebServices;

  CartRepository(this.cartWebServices);

  Future<Cart?> addCart(Cart cart) async {
    final response = await cartWebServices.addCart(cart);
    if (response.isNotEmpty) {
      return Cart.fromJson(response);
    }
    return null;
  }

  Future<Cart?> getCart(int userId) async {
    final response = await cartWebServices.getCart(userId);
    if (response.isNotEmpty) {
      return Cart.fromJson(response);
    }
    return null;
  }
}
