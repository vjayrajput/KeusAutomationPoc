import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/error/error_handler.dart';
import '../../../domain/usecases/get_categories_use_case.dart';
import '../../../domain/usecases/get_hit_of_week_products_use_case.dart';
import '../../../domain/usecases/get_product_by_category_use_case.dart';
import '../../models/product_ui_model.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetHitOfWeekProductsUseCase getHitOfWeekProductsUseCase;
  final GetProductByCategoryUseCase getProductByCategoryUseCase;

  ProductBloc(this.getCategoriesUseCase, this.getHitOfWeekProductsUseCase,
      this.getProductByCategoryUseCase)
      : super(ProductInitial()) {
    on<FetchCategoriesEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final categories = await getCategoriesUseCase.call();
        emit(CategoriesLoaded(categories));

        if (categories.isNotEmpty) {
          add(FetchProductsByCategoryEvent(categories[0]));
        }
      } catch (e) {
        emit(ProductError(ErrorHandler.getErrorMessage(e)));
      }
    });

    on<FetchHitOfWeekProductsEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final productEntities = await getHitOfWeekProductsUseCase.call();
        final hitOfWeekProducts = productEntities.map((entity) {
          return ProductUiModel.fromEntity(entity);
        }).toList();
        emit(HitOfWeekProductsLoaded(hitOfWeekProducts));
      } catch (e) {
        emit(ProductError(ErrorHandler.getErrorMessage(e)));
      }
    });

    on<FetchProductsByCategoryEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final productEntities =
            await getProductByCategoryUseCase.call(event.category);
        final categoryProducts = productEntities.map((entity) {
          return ProductUiModel.fromEntity(entity);
        }).toList();
        emit(ProductsByCategoryLoaded(categoryProducts));
      } catch (e) {
        emit(ProductError(ErrorHandler.getErrorMessage(e)));
      }
    });
  }
}
