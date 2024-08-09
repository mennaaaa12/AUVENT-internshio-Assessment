import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/Features/home/data/model/product_model.dart';
import 'package:store/Features/home/data/repository/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;

  ProductCubit({required this.productRepository}) : super(ProductInitial());

  Future<void> getAllProducts() async {
    try {
      final products = await productRepository.getAllProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}


