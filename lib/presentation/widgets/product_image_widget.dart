import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String image;
  final double size;

  const ProductImage({
    super.key,
    required this.image,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.asset(
        image,
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}
