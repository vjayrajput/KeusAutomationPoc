import 'package:flutter/material.dart';
import 'package:keus_automation_poc/core/extensions/toast_extension.dart';

import '../../../core/constants/strings.dart';

class ProductAddExtraToppingSection extends StatelessWidget {
  final String productName;

  const ProductAddExtraToppingSection({super.key, required this.productName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.showToast(Strings.addInProductPressed);
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "${Strings.addIn} $productName",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              size: 28,
            )
          ],
        ),
      ),
    );
  }
}
