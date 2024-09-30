import 'package:flutter/material.dart';

import 'price_tag_widget.dart';

class BlackPriceTag extends StatelessWidget {
  final double price;
  final String currency;

  const BlackPriceTag({
    super.key,
    required this.price,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return PriceTag(
      price: price,
      currency: currency,
      backgroundColor: Colors.black,
      textColor: Colors.grey[300]!,
    );
  }
}
