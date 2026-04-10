import 'package:dartz/dartz.dart';
import 'package:menu_master_app/core/errors/failure.dart';
import 'package:menu_master_app/features/menu/data/datasource/menu_datasource.dart';
import 'package:menu_master_app/features/menu/domain/entity/category.dart';
import 'package:menu_master_app/features/menu/domain/entity/product.dart';
import 'package:menu_master_app/features/menu/domain/repository/menu_repository.dart';

class MenuRepositoryImpl implements MenuRepository{
  final MenuDataSource menuDatasource;

  const MenuRepositoryImpl(this.menuDatasource);

  @override
  Future<Either<Failure, List<Category>>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategories() {
    // TODO: implement getProductsByCategories
    throw UnimplementedError();
  }
}