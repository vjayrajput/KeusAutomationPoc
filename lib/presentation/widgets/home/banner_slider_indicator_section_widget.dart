import 'package:flutter/material.dart';
import 'package:keus_automation_poc/core/extensions/widget_extensions.dart';

class BannerSliderIndicatorSection extends StatelessWidget {
  final int itemCount;
  final double currentPage;

  const BannerSliderIndicatorSection({
    super.key,
    required this.itemCount,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    if (itemCount <= 1) return Container(); // Don't show if there's only 1 item

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        itemCount,
        (index) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              height: 4,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                // Animation duration
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color:
                      currentPage.round() == index ? Colors.black : Colors.grey,
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                ),
              ),
            ),
          );
        },
      ),
    ).withHorizontalPadding(12).withBottomPadding(12);
  }
}
