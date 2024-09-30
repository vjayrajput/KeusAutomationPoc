import 'package:dartz/dartz.dart';

import '../entities/product_entity.dart';
import '../repositories/cart_repository.dart';

class FetchCartItemsUseCase {
  final CartRepository cartRepository;

  FetchCartItemsUseCase(this.cartRepository);

  Future<Either<String, List<ProductEntity>>> call() async {
    return cartRepository.getCartItems();
  }
}
