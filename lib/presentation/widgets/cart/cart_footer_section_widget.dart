import 'package:flutter/material.dart';

import 'cart_pay_button_section_widget.dart';
import 'cart_payment_section_widget.dart';

class CartFooterSection extends StatelessWidget {
  const CartFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 8),
        CartPaymentSection(),
        SizedBox(height: 8),
        CartPayButtonSection(),
      ],
    );
  }
}
