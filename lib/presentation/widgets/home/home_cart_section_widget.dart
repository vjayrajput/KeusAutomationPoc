import 'package:flutter/material.dart';
import 'package:keus_automation_poc/core/extensions/widget_extensions.dart';

import '../../../core/constants/strings.dart';

class HomeCartSection extends StatelessWidget {
  final double totalPrice;

  const HomeCartSection({
    required this.totalPrice,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              Strings.cart,
              style: TextStyle(color: Colors.grey[300], fontSize: 16),
            ),
          ),
          Text(
            Strings.inMinutes,
            style: TextStyle(color: Colors.grey[300], fontSize: 12),
          ),
          Text(
            '\$${totalPrice.toStringAsFixed(2)}',
            style: TextStyle(color: Colors.grey[300], fontSize: 16),
          ),
        ],
      ).withHorizontalPadding(12),
    );
  }
}
