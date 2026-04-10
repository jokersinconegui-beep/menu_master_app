import 'package:dartz/dartz.dart';
import 'package:menu_master_app/core/errors/failure.dart';
import 'package:menu_master_app/features/menu/domain/entity/product.dart';

import '../entity/category.dart';

abstract class MenuRepository {
  Future<Either<Failure,List<Category>>> getCategories();
  Future<Either<Failure,List<Product>>> getProducts();
  Future<Either<Failure,List<Product>>> getProductsByCategories();
}