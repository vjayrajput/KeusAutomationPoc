import 'package:dartz/dartz.dart';

import '../entities/product_entity.dart';
import '../repositories/cart_repository.dart';

class IncreaseProductQuantityUseCase {
  final CartRepository cartRepository;

  IncreaseProductQuantityUseCase(this.cartRepository);

  Future<Either<String, void>> call(ProductEntity product) {
    return cartRepository.increaseProductQuantity(product);
  }
}
