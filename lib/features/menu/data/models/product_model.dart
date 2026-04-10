import 'package:menu_master_app/features/menu/domain/entity/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.categoryId,
    required super.description,
    required super.imageUrl,
    required super.available,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      categoryId: json['categoryId'].toString(),
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      available: json['available'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'categoryId': categoryId,
      'description': description,
      'imageUrl': imageUrl,
      'available': available,
    };
  }
}
