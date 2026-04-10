import 'package:dartz/dartz.dart';
import 'package:menu_master_app/core/errors/failure.dart';
import 'package:menu_master_app/features/menu/domain/entity/product.dart';
import 'package:menu_master_app/features/menu/domain/repository/menu_repository.dart';

class GetProductsUseCase {
  final MenuRepository menuRepository;

  GetProductsUseCase(this.menuRepository);

  Future<Either<Failure, List<Product>>> call() {
    return menuRepository.getProducts();
  }
}
