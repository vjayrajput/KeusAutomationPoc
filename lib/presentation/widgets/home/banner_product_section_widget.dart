import 'package:flutter/material.dart';

import '../../models/product_ui_model.dart';
import 'banner_item_widget.dart';

class BannerProductSection extends StatelessWidget {
  final ProductUiModel product;
  final VoidCallback onTap;

  const BannerProductSection({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: BannerItem(product: product),
    );
  }
}
