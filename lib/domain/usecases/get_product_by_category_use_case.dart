import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetProductByCategoryUseCase {
  final ProductRepository repository;

  GetProductByCategoryUseCase(this.repository);

  Future<List<ProductEntity>> call(String category) {
    return repository.getProductByCategory(category);
  }
}
