import 'dart:convert';

import 'package:product_app/config/String/name_url.dart';
import 'package:product_app/config/error/error_exceptio.dart';
import 'package:product_app/features/porduct/data/Model/product_model.dart';
import 'package:http/http.dart' as http; 
abstract class ProductRomoteData{
  Future<List<ProductModel>>getProduct();
    Future<void>addProduct(ProductModel product);
  Future<void>deleteProduct(int proId);
  Future<void>updateProduct(ProductModel product);

}



class RomoteDataImp implements ProductRomoteData  {
  final http.Client client;

  RomoteDataImp({required this.client}) {
    // TODO: implement RomoteDataImp
    throw UnimplementedError();
  }




@override
  Future<List<ProductModel>> getProduct() async{
  final response=await client.get(Uri.parse("$BASE_URL"+"/products"), headers: {"Content-Type": "application/json"}, );
  if( response.body.isNotEmpty){
if (response.statusCode == 200) {
var  dcodedata = jsonDecode(response.body) ;
final List dcodedatapro= dcodedata["products"] as List;

List<ProductModel> productModels = dcodedatapro.map<ProductModel>((productModel) => ProductModel.fromJson(productModel)).toList();
return productModels;
 
  }else{
    throw ServerException();
  }
  }else{
     throw EmptyCacheException();

  }
  }
  @override
  Future<void> addProduct(ProductModel product)async {
final body={
        "title": product.title,
        "description": product.description,
        "price": product.price,
        "discountPercentage": product.discountPercentage,
        "rating": product.rating,
        "stock": product.stock,
        "brand": product.brand,
        "category": product.category,
        "thumbnail": product.thumbnail,
};

  final response=await client.post(Uri.parse("$BASE_URL"+"/products/"), body:body ,   headers: { 'Content-Type': 'application/json' }, );
if (response.statusCode == 201) {
      
    } else {
      throw ServerException();
    }

  }

  @override
  Future<void> deleteProduct(int proId) async{
  final response=await client.delete(Uri.parse("$BASE_URL""/products/${proId.toString()}"));
  if (response.statusCode == 200) {
      
    } else {
      throw ServerException();
    }

  }

    @override
  Future<void> updateProduct(ProductModel product) async{
        final portId = product.id.toString();

final body={
        "title": product.title,
        "description": product.description,
        "price": product.price,
        "discountPercentage": product.discountPercentage,
        "rating": product.rating,
        "stock": product.stock,
        "brand": product.brand,
        "category": product.category,
        "thumbnail": product.thumbnail,
};

  final response=await client.patch(Uri.parse("$BASE_URL"+"/products/$portId"), body:body ,   headers: { 'Content-Type': 'application/json' }, );
if (response.statusCode == 201) {
      
    } else {
      throw ServerException();
    }

  
  


}
  }

  

