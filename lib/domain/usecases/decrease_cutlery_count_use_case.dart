import 'package:dartz/dartz.dart';

import '../repositories/cart_repository.dart';

class DecreaseCutleryCountUseCase {
  final CartRepository cartRepository;

  DecreaseCutleryCountUseCase(this.cartRepository);

  Future<Either<String, void>> call() {
    return cartRepository.decreaseCutleryCount();
  }
}
