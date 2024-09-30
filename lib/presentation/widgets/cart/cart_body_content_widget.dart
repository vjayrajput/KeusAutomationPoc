import 'package:flutter/material.dart';

import 'cart_footer_section_widget.dart';
import 'cart_header_content_section_widget.dart';

class CartBodyContent extends StatelessWidget {
  const CartBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(24, 1, 16, 24),
      child: Column(
        children: [
          CartHeaderContentSection(),
          CartFooterSection(),
        ],
      ),
    );
  }
}
