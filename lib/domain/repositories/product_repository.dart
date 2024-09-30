import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<String>> getCategories();

  Future<List<ProductEntity>> getHitOfWeekProducts();

  Future<Map<String, List<ProductEntity>>> getAllProducts();

  Future<List<ProductEntity>> getProductByCategory(String category);
}
