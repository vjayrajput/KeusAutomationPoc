import '../../models/product_ui_model.dart';
import '../base_state.dart';

abstract class CartState extends BaseState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final List<ProductUiModel> cartItems;
  final double total;
  final double deliveryCharge;
  final int cutleryCount;

  CartSuccess(this.cartItems, {this.cutleryCount = 1})
      : total = cartItems.fold(
            0.0, (sum, item) => sum + (item.price * item.quantity)),
        deliveryCharge = (cartItems.fold(
                    0.0, (sum, item) => sum + (item.price * item.quantity)) <
                30)
            ? 5.0
            : 0.0;
}

class CartError extends CartState {
  final String errorMessage;

  CartError(this.errorMessage);
}
