import 'package:dartz/dartz.dart';

import '../repositories/cart_repository.dart';

class GetCutleryCountUseCase {
  final CartRepository cartRepository;

  GetCutleryCountUseCase(this.cartRepository);

  Future<Either<String, int>> call() async {
    return cartRepository.getCutleryCount();
  }
}
