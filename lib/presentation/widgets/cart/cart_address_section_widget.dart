import 'package:flutter/material.dart';
import 'package:keus_automation_poc/core/extensions/toast_extension.dart';

import '../../../core/constants/strings.dart';

class CartAddressSection extends StatelessWidget {
  const CartAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Expanded(
          child: Text(
            Strings.dummyAddress,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            context.showToast(Strings.changeAddressPressed);
          },
          child: const Text(
            Strings.changeAddress,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
