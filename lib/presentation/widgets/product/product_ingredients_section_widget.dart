import 'package:flutter/material.dart';

import '../../models/info_ui_model.dart';
import 'product_ingredient_item_widget.dart';

class ProductIngredientsSection extends StatelessWidget {
  final List<InfoUiModel> infoList;

  const ProductIngredientsSection({
    super.key,
    required this.infoList,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: infoList.map(
          (infoModel) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ProductIngredientItem(
                key: ValueKey(infoModel.id),
                value: infoModel.value,
                unit: infoModel.unit,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
