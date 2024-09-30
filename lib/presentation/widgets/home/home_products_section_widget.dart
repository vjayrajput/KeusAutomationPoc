import 'package:flutter/material.dart';
import 'package:keus_automation_poc/core/extensions/widget_extensions.dart';

import '../../models/product_ui_model.dart';
import 'product_item_widget.dart';

class HomeProductsSection extends StatefulWidget {
  final List<ProductUiModel> products;
  final Function(ProductUiModel)? onItemTap;

  const HomeProductsSection({
    super.key,
    required this.products,
    required this.onItemTap,
  });

  @override
  State<StatefulWidget> createState() {
    return _HomeProductsSectionState();
  }
}

class _HomeProductsSectionState extends State<HomeProductsSection> {
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        var product = widget.products[index];
        return InkWell(
          onTap: () {
            widget.onItemTap!(product);
          },
          borderRadius: BorderRadius.circular(8),
          child: ProductItem(product: product)
              .withHorizontalPadding(16)
              .withVerticalPadding(6),
        );
      },
    );
  }
}
