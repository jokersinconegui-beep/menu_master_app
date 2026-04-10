import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final double price;
  final String categoryId;
  final String description;
  final String imageUrl;
  final bool available;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.categoryId,
    required this.description,
    required this.imageUrl,
    required this.available,
  });

  @override
  List<Object?> get props => [id, name, price, categoryId, available];
}