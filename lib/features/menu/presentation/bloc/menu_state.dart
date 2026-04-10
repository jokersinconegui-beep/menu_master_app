import 'package:menu_master_app/features/menu/domain/entity/category.dart';
import 'package:menu_master_app/features/menu/domain/entity/product.dart';

abstract class MenuState {}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class CategoriesLoaded extends MenuState {
  final List<Category> categories;
  CategoriesLoaded(this.categories);
}

class ProductsLoaded extends MenuState {
  final List<Product> products;
  final String selectedCategoryId;
  ProductsLoaded(this.products, this.selectedCategoryId);
}

class MenuError extends MenuState {
  final String message;
  MenuError(this.message);
}