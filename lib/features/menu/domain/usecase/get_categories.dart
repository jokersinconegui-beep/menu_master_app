import 'package:dartz/dartz.dart';
import 'package:menu_master_app/features/menu/domain/entity/category.dart';
import 'package:menu_master_app/features/menu/domain/repository/menu_repository.dart';
import '../../../../core/errors/failure.dart';

class GetCategoriesUseCase {
  final MenuRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<Either<Failure, List<Category>>> call() {
    return repository.getCategories();
  }
}