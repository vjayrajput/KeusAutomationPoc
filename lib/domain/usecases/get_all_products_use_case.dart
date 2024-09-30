import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetAllProductsUseCase {
  final ProductRepository repository;

  GetAllProductsUseCase(this.repository);

  Future<Map<String, List<ProductEntity>>> call() {
    return repository.getAllProducts();
  }
}
