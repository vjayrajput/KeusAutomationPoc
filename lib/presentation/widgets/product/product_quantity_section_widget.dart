import 'package:flutter/material.dart';

import '../icon_button_widget.dart';

class ProductQuantitySection extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const ProductQuantitySection({
    super.key,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          IconButtonWithContainer(
            icon: Icons.remove,
            onPressed: onDecrease,
          ),
          Text(
            '$quantity',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          IconButtonWithContainer(
            icon: Icons.add,
            onPressed: onIncrease,
          ),
        ],
      ),
    );
  }
}
