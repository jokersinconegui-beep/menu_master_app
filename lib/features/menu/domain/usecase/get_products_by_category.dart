import 'package:dartz/dartz.dart';
import 'package:menu_master_app/core/errors/failure.dart';
import 'package:menu_master_app/features/menu/domain/entity/product.dart';
import 'package:menu_master_app/features/menu/domain/repository/menu_repository.dart';

class GetProductsByCategoryUseCase {
  final MenuRepository menuRepository;

  GetProductsByCategoryUseCase(this.menuRepository);

  Future<Either<Failure, List<Product>>> call(String categoryId) {
    return menuRepository.getProductsByCategories();
  }
}
