import 'package:flutter/material.dart';

import '../../models/product_ui_model.dart';
import '../price_tag_grey_widget.dart';
import '../product_image_widget.dart';
import '../product_name_widget.dart';

class ProductItem extends StatelessWidget {
  final ProductUiModel product;

  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProductImage(
            image: product.image,
            size: 100,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                ProductName(
                  name: product.name,
                ),
                const SizedBox(height: 8.0),
                ProductPriceInfo(
                  product: product,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductPriceInfo extends StatelessWidget {
  final ProductUiModel product;

  const ProductPriceInfo({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GreyPriceTag(
          price: product.price,
          currency: product.currency,
        ),
        const SizedBox(width: 12.0),
        Text(
          "${product.infoList[0].value}-${product.infoList[0].unit}",
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
