import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keus_automation_poc/core/extensions/widget_extensions.dart';

import '../../../core/constants/strings.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/cart/cart_event.dart';
import '../../bloc/cart/cart_state.dart';
import '../icon_button_widget.dart';

class CartCutleryQuantitySection extends StatefulWidget {
  const CartCutleryQuantitySection({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CartCutleryQuantitySectionState();
  }
}

class _CartCutleryQuantitySectionState
    extends State<CartCutleryQuantitySection> {
  int cutleryCount = 1; // Initialize with default value or state

  @override
  void initState() {
    super.initState();
    // You can load the initial value of cutleryCount from the CartBloc state here
    final cartBloc =
        context.read<CartBloc>(); // This will not listen for changes
    final currentState = cartBloc.state;
    if (currentState is CartSuccess) {
      setState(() {
        cutleryCount = currentState.cutleryCount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.add_business),
        const Text(
          Strings.cutlery,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        Row(
          children: [
            IconButtonWithContainer(
              icon: Icons.remove,
              onPressed: () {
                setState(() {
                  if (cutleryCount > 1) {
                    cutleryCount--;
                  }
                  cartBloc.add(DecreaseCutleryCount());
                });
              },
            ),
            Text(
              '$cutleryCount',
              style: const TextStyle(fontSize: 16),
            ).withHorizontalPadding(8),
            IconButtonWithContainer(
              icon: Icons.add,
              onPressed: () {
                setState(() {
                  cutleryCount++;
                });
                cartBloc.add(IncreaseCutleryCount());
              },
            ),
          ],
        ),
      ],
    ).withVerticalPadding(4);
  }
}
