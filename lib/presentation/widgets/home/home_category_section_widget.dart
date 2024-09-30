import 'package:flutter/material.dart';
import 'package:keus_automation_poc/core/extensions/widget_extensions.dart';

import '../icon_button_widget.dart';
import 'home_category_item_widget.dart';

class HomeCategorySection extends StatefulWidget {
  final List<String> categories;
  final Function()? onFilterTap;
  final Function(String)? onItemTap;

  const HomeCategorySection({
    super.key,
    required this.categories,
    required this.onFilterTap,
    required this.onItemTap,
  });

  @override
  State<StatefulWidget> createState() {
    return _HomeCategorySectionState();
  }
}

class _HomeCategorySectionState extends State<HomeCategorySection> {
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory =
        widget.categories.isNotEmpty ? widget.categories[0] : null;
  }

  void _handleItemTap(String category) {
    setState(() {
      selectedCategory = category; // Update the selected category
    });
    if (widget.onItemTap != null) {
      widget.onItemTap!(category); // Call the provided callback if available
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButtonWithContainer(
            icon: Icons.tune, onPressed: widget.onFilterTap!),
        const SizedBox(width: 4),
        Expanded(
          child: SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.categories.length,
              itemBuilder: (context, index) {
                String category = widget.categories[index];
                bool isSelected = selectedCategory == category;
                return HomeCategoryItem(
                  category: category,
                  isSelected: isSelected,
                  onItemTap: _handleItemTap,
                );
              },
            ),
          ),
        ),
      ],
    ).withStartPadding(16);
  }
}
