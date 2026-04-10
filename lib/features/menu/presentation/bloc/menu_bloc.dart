import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_master_app/features/menu/domain/usecase/get_categories.dart';
import 'package:menu_master_app/features/menu/domain/usecase/get_products_by_category.dart';
import 'menu_event.dart';
import 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetProductsByCategoryUseCase getProductsByCategoryUseCase;

  MenuBloc({
    required this.getCategoriesUseCase,
    required this.getProductsByCategoryUseCase,
  }) : super(MenuInitial()) {
    on<LoadCategoriesEvent>(_onLoadCategories);
    on<LoadProductsByCategoryEvent>(_onLoadProductsByCategory);
  }

  Future<void> _onLoadCategories(
    LoadCategoriesEvent event,
    Emitter<MenuState> emit,
  ) async {
    emit(MenuLoading());
    
    final result = await getCategoriesUseCase();
    
    result.fold(
      (failure) => emit(MenuError(failure.message)),
      (categories) {
        emit(CategoriesLoaded(categories));
        // Cargar productos de la primera categoría por defecto
        if (categories.isNotEmpty) {
          add(LoadProductsByCategoryEvent(categoryId: categories.first.id));
        }
      },
    );
  }

  Future<void> _onLoadProductsByCategory(
    LoadProductsByCategoryEvent event,
    Emitter<MenuState> emit,
  ) async {
    final currentState = state;
    
    final result = await getProductsByCategoryUseCase(event.categoryId);
    
    result.fold(
      (failure) => emit(MenuError(failure.message)),
      (products) {
        if (currentState is CategoriesLoaded) {
          emit(ProductsLoaded(products, event.categoryId));
        } else {
          emit(ProductsLoaded(products, event.categoryId));
        }
      },
    );
  }
}