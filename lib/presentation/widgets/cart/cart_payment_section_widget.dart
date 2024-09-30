import 'package:flutter/material.dart';
import 'package:keus_automation_poc/core/extensions/toast_extension.dart';
import 'package:keus_automation_poc/core/extensions/widget_extensions.dart';

import '../../../core/constants/strings.dart';

class CartPaymentSection extends StatelessWidget {
  const CartPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          Strings.paymentMethod,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        InkWell(
          onTap: () {
            context.showToast(Strings.paymentMethodPressed);
          },
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                const Icon(Icons.payment),
                Expanded(
                  child: const Text(
                    Strings.applePay,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ).withStartPadding(12),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  size: 28,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
