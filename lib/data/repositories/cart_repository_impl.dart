import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasource/db/db_helper.dart';
import '../models/product_model.dart';

class CartRepositoryImpl implements CartRepository {
  final DbHelper dbHelper;

  CartRepositoryImpl(this.dbHelper);

  @override
  Future<Either<String, void>> insertOrUpdateCartItem(
      ProductEntity product, int quantity) async {
    try {
      final model = ProductModel.fromEntity(product);
      await dbHelper.insertOrUpdateCartItem(model, quantity);
      return const Right(null);
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, List<ProductEntity>>> getCartItems() async {
    try {
      final cartItems = await dbHelper.getCartItems();
      return Right(cartItems.map((model) => model.toEntity()).toList());
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, int>> getCutleryCount() async {
    try {
      var cutleryCount = await dbHelper.getCutleryCount();
      return Right(cutleryCount);
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, void>> increaseProductQuantity(
      ProductEntity product) async {
    try {
      final cartItems = await dbHelper.getCartItems();
      final existingProduct =
          cartItems.firstWhere((item) => item.id == product.id);

      await dbHelper.updateProductQuantity(
          existingProduct.id, existingProduct.quantity + 1);
      return const Right(null);
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, void>> decreaseProductQuantity(
      ProductEntity product) async {
    try {
      final cartItems = await dbHelper.getCartItems();
      final existingProduct =
          cartItems.firstWhere((item) => item.id == product.id);

      if (existingProduct.quantity > 1) {
        await dbHelper.updateProductQuantity(
            existingProduct.id, existingProduct.quantity - 1);
      } else {
        await dbHelper.deleteProduct(existingProduct.id);
      }
      return const Right(null);
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, void>> increaseCutleryCount() async {
    try {
      var cutleryCount = await dbHelper.getCutleryCount();
      cutleryCount++;
      await dbHelper.insertOrUpdateCutleryCount(cutleryCount);
      return const Right(null);
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, void>> decreaseCutleryCount() async {
    try {
      var cutleryCount = await dbHelper.getCutleryCount();
      if (cutleryCount > 1) {
        cutleryCount--;
        await dbHelper.insertOrUpdateCutleryCount(cutleryCount);
      }
      return const Right(null);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
