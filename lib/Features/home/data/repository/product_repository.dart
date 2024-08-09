import 'package:store/Features/home/data/model/product_model.dart';
import 'package:store/Features/home/data/web_service/product_web_services.dart';

class ProductRepository {
  final ProductWebServices productWebServices;

  ProductRepository(this.productWebServices);

  Future<List<ProductModel>> getAllProducts() async {
    final products = await productWebServices.getAllProducts();
    return products.map((product) => ProductModel.fromJson(product)).toList();
  }
}
