// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:product_app/features/porduct/domen/Entity/product_entity.dart';
import 'package:product_app/features/porduct/domen/repository/product_repository.dart';

class AddProduct {

ProductRepository repository;
  AddProduct({
    required this.repository,
  });
Future<void> call(Product product)async{
   await repository.addProduct(product);
}
}
