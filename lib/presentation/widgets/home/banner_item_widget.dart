import 'package:flutter/material.dart';
import 'package:keus_automation_poc/core/extensions/widget_extensions.dart';

import '../../models/product_ui_model.dart';
import '../price_tag_black_widget.dart';
import '../product_image_widget.dart';
import '../product_name_widget.dart';

class BannerItem extends StatelessWidget {
  final ProductUiModel product;

  const BannerItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    double topMarginForImage = 24;

    return Container(
      margin: EdgeInsets.fromLTRB(16, topMarginForImage, 16, 0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background with product details
          ProductBackground(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ProductName(
                    name: product.name,
                  ),
                ),
                const SizedBox(height: 10),
                // Price tag
                BlackPriceTag(
                  price: product.price,
                  currency: product.currency,
                ),
              ],
            ).withTopPadding(110),
          ),
          // Overlapping product image
          Positioned(
            top: -topMarginForImage,
            left: 0,
            right: 0,
            child: Center(
              child: ProductImage(
                image: product.image,
                size: 140,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductBackground extends StatelessWidget {
  final Widget child;

  const ProductBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[700]!, Colors.purple[100]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: child,
    );
  }
}
