abstract class MenuEvent {}

class LoadCategoriesEvent extends MenuEvent {}

class LoadProductsByCategoryEvent extends MenuEvent {
  final String categoryId;
  LoadProductsByCategoryEvent({required this.categoryId});
}