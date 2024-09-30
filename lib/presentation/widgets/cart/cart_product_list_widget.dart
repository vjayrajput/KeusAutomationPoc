import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/cart/cart_event.dart';
import '../../bloc/cart/cart_state.dart';
import '../../models/product_ui_model.dart';
import 'cart_product_item_widget.dart';

class CartProductList extends StatefulWidget {
  const CartProductList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CartProductListState();
  }
}

class _CartProductListState extends State<CartProductList> {
  List<ProductUiModel> products = List.empty();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartSuccess) {
          if (state.cartItems.isEmpty) {
            if (!context.mounted) return;
            Navigator.pop(context);
          }
          setState(() {
            products = state.cartItems;
          });
        } else if (state is CartError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Cart error: ${state.errorMessage}"),
            ),
          );
        }
      },
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return CartProductItem(
            key: ValueKey(product.id),
            product: product,
            onIncrement: () =>
                context.read<CartBloc>().add(IncreaseProductQuantity(product)),
            onDecrement: () =>
                context.read<CartBloc>().add(DecreaseProductQuantity(product)),
          );
        },
      ),
    );
  }
}
