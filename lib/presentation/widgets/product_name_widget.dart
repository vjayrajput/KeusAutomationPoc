import 'package:flutter/material.dart';

class ProductName extends StatelessWidget {
  final String name;

  const ProductName({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
