import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/strings.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/cart/cart_state.dart';

class CartDeliveryChargesSection extends StatelessWidget {
  const CartDeliveryChargesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.delivery,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                Strings.freeDeliveryFrom,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
        BlocSelector<CartBloc, CartState, double>(selector: (state) {
          if (state is CartSuccess) {
            return state.deliveryCharge;
          }
          return 0.0;
        }, builder: (context, deliveryCharge) {
          return Text(
            "\$$deliveryCharge",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          );
        }),
      ],
    );
  }
}
