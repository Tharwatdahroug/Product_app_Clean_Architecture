import 'package:product_app/features/porduct/domen/Entity/product_entity.dart';

abstract class ProductRepository {
  Future<List<Product>>getProduct();
    Future<void>addProduct(Product product);
  Future<void>deleteProduct(int proId);
  Future<void>updateProduct(Product product);

  
}