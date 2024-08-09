import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/Features/cart/cubit/cubit/cart_state.dart';
import 'package:store/Features/cart/data/model/cart_model.dart';
import 'package:store/Features/cart/data/repo/cart_repository.dart';


class CartCubit extends Cubit<CartState> {
  final CartRepository cartRepository;

  CartCubit({required this.cartRepository}) : super(CartInitial());

  Future<void> addCart(Cart cart) async {
    try {
      final updatedCart = await cartRepository.addCart(cart);
      if (updatedCart != null) {
        emit(CartUpdated(updatedCart));
      } else {
        emit(CartError('Failed to add item to cart'));
      }
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> getCart(int userId) async {
    try {
      final cart = await cartRepository.getCart(userId);
      if (cart != null) {
        emit(CartLoaded(cart));
      } else {
        emit(CartError('Failed to load cart'));
      }
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }
}
