import 'package:flutter/material.dart';

import '../models/product_ui_model.dart';
import '../widgets/bottomsheet/custom_bottom_sheet_layout_widget.dart';
import '../widgets/product/product_add_extra_topping_section_widget.dart';
import '../widgets/product/product_bottom_section_widget.dart';
import '../widgets/product/product_information_section_widget.dart';
import '../widgets/product/product_ingredients_section_widget.dart';
import '../widgets/product_image_widget.dart';

class ProductDetails extends StatefulWidget {
  final ProductUiModel product;

  const ProductDetails({
    super.key,
    required this.product,
  });

  @override
  State<StatefulWidget> createState() {
    return _ProductDetailsState();
  }
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return CustomBottomSheetLayout(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 1, 16, 24),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Center(
                    child: ProductImage(
                      image: widget.product.image,
                      size: deviceHeight * 0.30,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ProductInformationSection(
                    name: widget.product.name,
                    description: widget.product.description,
                  ),
                  const SizedBox(height: 16),
                  ProductIngredientsSection(infoList: widget.product.infoList),
                  const SizedBox(height: 8),
                  ProductAddExtraToppingSection(
                      productName: widget.product.name),
                  const SizedBox(height: 8),
                ],
              ),
            )),
            Column(
              children: [
                const SizedBox(height: 8),
                ProductBottomSection(
                  quantity: quantity,
                  product: widget.product,
                  onIncrease: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  onDecrease: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
