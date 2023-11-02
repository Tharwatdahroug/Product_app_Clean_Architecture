import 'package:product_app/features/porduct/domen/Entity/product_entity.dart';

class ProductModel extends Product {


    ProductModel({
        required id,
        required title,
        required description,
        required price,
        required discountPercentage,
        required rating,
        required stock,
        required brand,
        required category,
        required thumbnail,
        required images,
    }) : super(id: id, title: title, description: description, price: price, discountPercentage:discountPercentage, rating: rating, stock: stock, brand: brand, category: category, thumbnail: thumbnail, images: images,);

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
