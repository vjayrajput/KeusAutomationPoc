import 'package:flutter/material.dart';
import 'package:keus_automation_poc/core/extensions/widget_extensions.dart';

import '../../../core/constants/strings.dart';

class BannerSliderHeaderSection extends StatelessWidget {
  const BannerSliderHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      Strings.hitsOfTheWeek,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      textAlign: TextAlign.start,
    ).withAllPadding(16);
  }
}
