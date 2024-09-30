import '../../models/product_model.dart';
import '../dummy_data.dart';

class ProductRemoteDataSource {
  Future<List<String>> fetchCategories() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    return DummyData.categories;
  }

  Future<List<ProductModel>> fetchHitOfWeekProducts() async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));
    return DummyData.hitOfWeekProducts;
  }

  Future<Map<String, List<ProductModel>>> fetchAllProducts() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    return DummyData.products;
  }

  Future<List<ProductModel>> fetchProductByCategory(String category) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    List<ProductModel> matchedProducts = [];
    matchedProducts = DummyData.products[category]!;
    return matchedProducts;
  }
}
