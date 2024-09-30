import 'package:flutter/material.dart';

class BottomSheetHandler extends StatelessWidget {
  const BottomSheetHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
    );
  }
}
