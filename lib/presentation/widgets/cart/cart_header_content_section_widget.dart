import 'package:flutter/material.dart';

import 'cart_address_section_widget.dart';
import 'cart_cutlery_quantity_section_widget.dart';
import 'cart_delivery_charges_section_widget.dart';
import 'cart_header_section_widget.dart';
import 'cart_product_list_widget.dart';

class CartHeaderContentSection extends StatelessWidget {
  const CartHeaderContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const CartHeaderSection(),
            const SizedBox(height: 8),
            const CartAddressSection(),
            Divider(color: Theme.of(context).dividerColor),
            const CartProductList(),
            Divider(color: Theme.of(context).dividerColor),
            const CartCutleryQuantitySection(),
            Divider(color: Theme.of(context).dividerColor),
            const CartDeliveryChargesSection(),
          ],
        ),
      ),
    );
  }
}
