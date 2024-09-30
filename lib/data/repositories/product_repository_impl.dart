import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasource/local/product_local_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl(this.localDataSource);

  @override
  Future<List<String>> getCategories() async {
    final categories = await localDataSource.fetchCategories();
    return categories;
  }

  @override
  Future<List<ProductEntity>> getHitOfWeekProducts() async {
    final productModels = await localDataSource.fetchHitOfWeekProducts();

    return productModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<Map<String, List<ProductEntity>>> getAllProducts() async {
    final productModelsMap = await localDataSource.fetchAllProducts();

    final productEntitiesMap = productModelsMap.map((category, productModels) {
      return MapEntry(
        category,
        productModels.map((model) => model.toEntity()).toList(),
      );
    });

    return productEntitiesMap;
  }

  @override
  Future<List<ProductEntity>> getProductByCategory(String category) async {
    final productModels =
        await localDataSource.fetchProductByCategory(category);

    return productModels.map((model) => model.toEntity()).toList();
  }
}
