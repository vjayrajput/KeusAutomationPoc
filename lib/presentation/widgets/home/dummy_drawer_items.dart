import 'package:flutter/material.dart';

import '../../../core/constants/strings.dart';

class DummyDrawerItems extends StatelessWidget {
  // A static list of items
  final List<String> items = [
    'Dummy Item 1',
    'Dummy Item 2',
    'Dummy Item 3',
    'Dummy Item 4',
    'Dummy Item 5',
  ];

  DummyDrawerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .inversePrimary, // Background color
          ),
          child: const Align(
            alignment: Alignment.center, // Center the content
            child: Text(
              Strings.delivery,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length, // Define the total count of list items
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
                onTap: () {},
              );
            },
          ),
        )
      ],
    );
  }
}
