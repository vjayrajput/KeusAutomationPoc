abstract class ProductEvent {}

class FetchCategoriesEvent extends ProductEvent {}

class FetchHitOfWeekProductsEvent extends ProductEvent {}

class FetchProductsByCategoryEvent extends ProductEvent {
  final String category;

  FetchProductsByCategoryEvent(this.category);
}
