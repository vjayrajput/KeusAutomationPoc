import 'package:get_it/get_it.dart';

import '../data/datasource/db/db_helper.dart';
import '../data/datasource/local/product_local_data_source.dart';
import '../data/datasource/remote/product_remote_data_source.dart';
import '../data/repositories/cart_repository_impl.dart';
import '../data/repositories/product_repository_impl.dart';
import '../domain/repositories/cart_repository.dart';
import '../domain/repositories/product_repository.dart';
import '../domain/usecases/add_to_cart_use_case.dart';
import '../domain/usecases/decrease_cutlery_count_use_case.dart';
import '../domain/usecases/decrease_product_quantity_use_case.dart';
import '../domain/usecases/fetch_cart_items_use_case.dart';
import '../domain/usecases/get_all_products_use_case.dart';
import '../domain/usecases/get_categories_use_case.dart';
import '../domain/usecases/get_cutlery_count_use_case.dart';
import '../domain/usecases/get_hit_of_week_products_use_case.dart';
import '../domain/usecases/get_product_by_category_use_case.dart';
import '../domain/usecases/increase_cutlery_count_use_case.dart';
import '../domain/usecases/increase_product_quantity_use_case.dart';
import '../presentation/bloc/product/product_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Register datasource
  getIt.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSource());
  getIt.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSource());
  getIt.registerLazySingleton<DbHelper>(() => DbHelper());

  // Register repository
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
        getIt<ProductLocalDataSource>(),
      ));
  getIt.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(
        getIt<DbHelper>(),
      ));

  // Register use case
  getIt.registerLazySingleton(() => GetCategoriesUseCase(
        getIt<ProductRepository>(),
      ));
  getIt.registerLazySingleton(() => GetHitOfWeekProductsUseCase(
        getIt<ProductRepository>(),
      ));
  getIt.registerLazySingleton(() => GetAllProductsUseCase(
        getIt<ProductRepository>(),
      ));
  getIt.registerLazySingleton(() => GetProductByCategoryUseCase(
        getIt<ProductRepository>(),
      ));
  getIt.registerLazySingleton(() => AddToCartUseCase(
        getIt<CartRepository>(),
      ));
  getIt.registerLazySingleton(() => DecreaseCutleryCountUseCase(
        getIt<CartRepository>(),
      ));
  getIt.registerLazySingleton(() => DecreaseProductQuantityUseCase(
        getIt<CartRepository>(),
      ));
  getIt.registerLazySingleton(() => FetchCartItemsUseCase(
        getIt<CartRepository>(),
      ));
  getIt.registerLazySingleton(() => GetCutleryCountUseCase(
        getIt<CartRepository>(),
      ));
  getIt.registerLazySingleton(() => IncreaseCutleryCountUseCase(
        getIt<CartRepository>(),
      ));
  getIt.registerLazySingleton(() => IncreaseProductQuantityUseCase(
        getIt<CartRepository>(),
      ));

  // register bloc
  getIt.registerFactory(() => ProductBloc(
        getIt<GetCategoriesUseCase>(),
        getIt<GetHitOfWeekProductsUseCase>(),
        getIt<GetProductByCategoryUseCase>(),
      ));
}
