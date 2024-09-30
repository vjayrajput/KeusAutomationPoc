import 'package:dartz/dartz.dart';

import '../repositories/cart_repository.dart';

class IncreaseCutleryCountUseCase {
  final CartRepository cartRepository;

  IncreaseCutleryCountUseCase(this.cartRepository);

  Future<Either<String, void>> call() {
    return cartRepository.increaseCutleryCount();
  }
}
