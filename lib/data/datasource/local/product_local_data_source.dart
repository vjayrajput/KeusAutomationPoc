import '../../models/product_model.dart';
import '../dummy_data.dart';

class ProductLocalDataSource {
  Future<List<String>> fetchCategories() async {
    return DummyData.categories;
  }

  Future<List<ProductModel>> fetchHitOfWeekProducts() async {
    return DummyData.hitOfWeekProducts;
  }

  Future<Map<String, List<ProductModel>>> fetchAllProducts() async {
    return DummyData.products;
  }

  Future<List<ProductModel>> fetchProductByCategory(String category) async {
    List<ProductModel> matchedProducts = [];
    matchedProducts = DummyData.products[category]!;
    return matchedProducts;
  }
}
