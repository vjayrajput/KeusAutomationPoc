import 'package:dartz/dartz.dart';

import '../entities/product_entity.dart';

abstract class CartRepository {
  Future<Either<String, void>> insertOrUpdateCartItem(
      ProductEntity product, int quantity);

  Future<Either<String, List<ProductEntity>>> getCartItems();

  Future<Either<String, int>> getCutleryCount();

  Future<Either<String, void>> increaseProductQuantity(ProductEntity product);

  Future<Either<String, void>> decreaseProductQuantity(ProductEntity product);

  Future<Either<String, void>> increaseCutleryCount();

  Future<Either<String, void>> decreaseCutleryCount();
}
