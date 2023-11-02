// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:product_app/features/porduct/domen/repository/product_repository.dart';

class deleteProduct {

ProductRepository repository;
 deleteProduct({
    required this.repository,
  });
Future<void> call(int prodId)async{
   await repository.deleteProduct(prodId);
}
}
