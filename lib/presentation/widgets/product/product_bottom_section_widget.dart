import 'package:flutter/material.dart';
import 'package:keus_automation_poc/presentation/widgets/product/product_quantity_section_widget.dart';

import '../../models/product_ui_model.dart';
import 'product_add_to_cart_button_widget.dart';

class ProductBottomSection extends StatelessWidget {
  final int quantity;
  final ProductUiModel product;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const ProductBottomSection({
    super.key,
    required this.quantity,
    required this.product,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProductQuantitySection(
          quantity: quantity,
          onIncrease: onIncrease,
          onDecrease: onDecrease,
        ),
        ProductAddToCartButton(product: product, quantity: quantity),
      ],
    );
  }
}
