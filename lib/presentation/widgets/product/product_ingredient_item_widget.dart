import 'package:flutter/material.dart';

class ProductIngredientItem extends StatelessWidget {
  final String value;
  final String unit;

  const ProductIngredientItem(
      {super.key, required this.value, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          unit,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
