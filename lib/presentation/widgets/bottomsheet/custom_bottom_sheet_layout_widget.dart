import 'package:flutter/material.dart';

import 'bottom_sheet_handler_widget.dart';

class CustomBottomSheetLayout extends StatelessWidget {
  final Widget child;

  const CustomBottomSheetLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 54),
        const BottomSheetHandler(),
        const SizedBox(height: 8),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0), // Top left radius
                topRight: Radius.circular(32.0), // Top right radius
              ),
              color: Colors.white,
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}
