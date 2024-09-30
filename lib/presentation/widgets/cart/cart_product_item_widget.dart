import 'package:flutter/material.dart';
import 'package:keus_automation_poc/core/extensions/widget_extensions.dart';

import '../../models/product_ui_model.dart';
import '../icon_button_widget.dart';

class CartProductItem extends StatelessWidget {
  final ProductUiModel product;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartProductItem({
    required this.product,
    required this.onIncrement,
    required this.onDecrement,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          product.image,
          width: 80,
          height: 80,
        ).withEndPadding(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.start,
              ),
              Row(
                children: [
                  IconButtonWithContainer(
                    icon: Icons.remove,
                    onPressed: onDecrement,
                  ),
                  Text(
                    '${product.quantity}',
                    style: const TextStyle(fontSize: 16),
                  ).withHorizontalPadding(8),
                  IconButtonWithContainer(
                    icon: Icons.add,
                    onPressed: onIncrement,
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          '\$${(product.price * product.quantity).toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ).withVerticalPadding(10);
  }
}
