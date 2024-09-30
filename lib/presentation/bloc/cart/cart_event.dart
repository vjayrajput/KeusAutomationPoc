import '../../models/product_ui_model.dart';

abstract class CartEvent {}

class AddProductToCart extends CartEvent {
  final ProductUiModel product;
  final int quantity;

  AddProductToCart(this.product, this.quantity);
}

class IncreaseProductQuantity extends CartEvent {
  final ProductUiModel product;

  IncreaseProductQuantity(this.product);
}

class DecreaseProductQuantity extends CartEvent {
  final ProductUiModel product;

  DecreaseProductQuantity(this.product);
}

class FetchCartItemsEvent extends CartEvent {}

class IncreaseCutleryCount extends CartEvent {}

class DecreaseCutleryCount extends CartEvent {}
