import 'package:flutter/material.dart';

class IconButtonWithContainer extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const IconButtonWithContainer({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
      ),
    );
  }
}
