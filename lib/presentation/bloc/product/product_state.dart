import '../../models/product_ui_model.dart';
import '../base_state.dart';

abstract class ProductState extends BaseState  {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class CategoriesLoaded extends ProductState {
  final List<String> categories;

  CategoriesLoaded(this.categories);
}

class HitOfWeekProductsLoaded extends ProductState {
  final List<ProductUiModel> hitOfWeekProducts;

  HitOfWeekProductsLoaded(this.hitOfWeekProducts);
}

class ProductsByCategoryLoaded extends ProductState {
  final List<ProductUiModel> categoryProducts;

  ProductsByCategoryLoaded(this.categoryProducts);
}

class ProductError extends ProductState {
  final String errorMessage;

  ProductError(this.errorMessage);
}
