import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/strings.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/cart/cart_event.dart';
import '../../models/product_ui_model.dart';

class ProductAddToCartButton extends StatelessWidget {
  final ProductUiModel product;
  final int quantity;

  const ProductAddToCartButton({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = context.read<CartBloc>();
    double totalPrice = product.price * quantity;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      height: 52,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          cartBloc.add(AddProductToCart(product, quantity));
          Navigator.pop(context);
        },
        child: Center(
          child: Text(
            "${Strings.addToCart} \$${totalPrice.toStringAsFixed(2)}",
            style: TextStyle(color: Colors.grey[300]),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
