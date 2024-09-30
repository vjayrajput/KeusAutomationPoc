import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keus_automation_poc/core/extensions/toast_extension.dart';
import 'package:keus_automation_poc/core/extensions/widget_extensions.dart';

import '../../../core/constants/strings.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/cart/cart_state.dart';

class CartPayButtonSection extends StatelessWidget {
  const CartPayButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.showToast(Strings.payCheckoutPressed);
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
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
                Strings.pay,
                style: TextStyle(color: Colors.grey[300], fontSize: 16),
              ),
            ),
            Text(
              Strings.inMinutes,
              style: TextStyle(color: Colors.grey[300], fontSize: 12),
            ),
            BlocSelector<CartBloc, CartState, double>(
              selector: (state) {
                if (state is CartSuccess) {
                  return state.total + state.deliveryCharge;
                }
                return 0.0;
              },
              builder: (context, totalPrice) {
                return Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.grey[300], fontSize: 16),
                );
              },
            ),
          ],
        ).withHorizontalPadding(12),
      ),
    );
  }
}
