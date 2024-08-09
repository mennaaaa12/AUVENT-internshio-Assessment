import 'package:meta/meta.dart';
import 'package:store/Features/cart/data/model/cart_model.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final Cart cart;

  CartLoaded(this.cart);
}

class CartUpdated extends CartState {
  final Cart cart;

  CartUpdated(this.cart);
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}
