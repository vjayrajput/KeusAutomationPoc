import 'package:dartz/dartz.dart';

import '../entities/product_entity.dart';
import '../repositories/cart_repository.dart';

class DecreaseProductQuantityUseCase {
  final CartRepository cartRepository;

  DecreaseProductQuantityUseCase(this.cartRepository);

  Future<Either<String, void>> call(ProductEntity product) {
    return cartRepository.decreaseProductQuantity(product);
  }
}
