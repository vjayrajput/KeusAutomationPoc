import 'package:flutter/material.dart';

import 'price_tag_widget.dart';

class GreyPriceTag extends StatelessWidget {
  final double price;
  final String currency;

  const GreyPriceTag({
    super.key,
    required this.price,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return PriceTag(
      price: price,
      currency: currency,
      backgroundColor: Colors.grey[300]!,
      textColor: Colors.black,
    );
  }
}
