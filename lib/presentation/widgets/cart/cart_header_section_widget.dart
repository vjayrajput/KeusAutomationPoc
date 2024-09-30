import 'package:flutter/material.dart';

import '../../../core/constants/strings.dart';

class CartHeaderSection extends StatelessWidget {
  const CartHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.weWillDeliverIn,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          Strings.minutesToTheAddress,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
