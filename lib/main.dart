import 'package:flutter/material.dart';

import 'di/di.dart';
import 'presentation/pages/home_page.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Defining primary and accent colors
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,

        // Configuring the AppBar theme
        appBarTheme: const AppBarTheme(
          color: Colors.white, // AppBar background color
          iconTheme: IconThemeData(color: Colors.black), // AppBar icon color
        ),

        // Configuring text theme
        textTheme: TextTheme(
          bodyLarge: const TextStyle(color: Colors.black), // Default text color
          bodyMedium: TextStyle(color: Colors.grey[800]), // Secondary text
        ),

        // Floating action button theme
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black, // Button color
        ),

        // Button theme for raised buttons, etc.
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black, // Text color on the button
          ),
        ),

        // ColorScheme for more customization
        colorScheme: ColorScheme.light(
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.grey[700]!,
          onSecondary: Colors.black,
          surface: Colors.grey[200]!,
        ),

        // Set the divider color globally
        dividerColor: Colors.grey[300],
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
