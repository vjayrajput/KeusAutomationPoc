import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final double price;
  final String currency;
  final Color backgroundColor;
  final Color textColor;

  const PriceTag({
    super.key,
    required this.price,
    required this.currency,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "$currency$price",
        style: TextStyle(
          fontSize: 14.0,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
