import 'package:uno/uno.dart';
import 'package:value_notifier/src/products/models/product_model.dart';

class ProductsService {
  final Uno uno;

  ProductsService(
    this.uno,
  );

  Future<List<ProductModel>> fetchProducts() async {
    final response = await uno.get('http://127.0.0.1:3031/products');
    final list = response.data as List;
    final products = list.map((e) => ProductModel.fromMap(e)).toList();

    return products;
  }
}
