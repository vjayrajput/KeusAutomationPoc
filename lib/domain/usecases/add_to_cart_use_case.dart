import 'package:dartz/dartz.dart';

import '../entities/product_entity.dart';
import '../repositories/cart_repository.dart';

class AddToCartUseCase {
  final CartRepository cartRepository;

  AddToCartUseCase(this.cartRepository);

  Future<Either<String, void>> call(ProductEntity product, int quantity) async {
    return cartRepository.insertOrUpdateCartItem(product, quantity);
  }
}
