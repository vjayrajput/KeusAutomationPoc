import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetHitOfWeekProductsUseCase {
  final ProductRepository repository;

  GetHitOfWeekProductsUseCase(this.repository);

  Future<List<ProductEntity>> call() {
    return repository.getHitOfWeekProducts();
  }
}
