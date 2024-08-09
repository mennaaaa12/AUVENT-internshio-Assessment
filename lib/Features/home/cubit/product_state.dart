part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductsLoaded extends ProductState {
  final List<ProductModel> product;

  ProductsLoaded(this.product);
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}
