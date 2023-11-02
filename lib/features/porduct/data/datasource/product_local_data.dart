import 'dart:convert';

import 'package:product_app/config/String/string.dart';
import 'package:product_app/config/error/error_exceptio.dart';
import 'package:product_app/features/porduct/data/Model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
abstract class ProductLocalData{
  Future<void>cacheproduct(List<ProductModel> productModels );
  Future <List<ProductModel>> getcach();
}




class ProductLocalDataImp implements ProductLocalData{
final SharedPreferences sharedPreferences;

  ProductLocalDataImp({required this.sharedPreferences});

  @override
  Future<void> cacheproduct(List<ProductModel> productModels) {
    final List productLocal= productModels.map<Map<String, dynamic>>((productmodel) => productmodel.toJson()).toList();
  sharedPreferences.setString(CACHE_DAtA,jsonEncode( productLocal));
  return Future.value(" ");
  }

  @override
  Future<List<ProductModel>> getcach() {

    final  decode= sharedPreferences.getString(CACHE_DAtA);
      if (decode != null) {
   List Productcach=jsonDecode(decode) as List;
   List<ProductModel>  Productcaech=Productcach.map<ProductModel>((productModel) =>ProductModel.fromJson(productModel)).toList();
   return Future.value(Productcaech);
  }else{
    throw EmptyCacheException();
  }
}
}