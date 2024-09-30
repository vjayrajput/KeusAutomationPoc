import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/strings.dart';
import 'di/di.dart';
import 'presentation/bloc/cart/cart_bloc.dart';
import 'presentation/bloc/product/product_bloc.dart';
import 'presentation/pages/home_page.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.foodUI,
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        textTheme: TextTheme(
          bodyLarge: const TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.grey[800]),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black, // Button color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
          ),
        ),
        colorScheme: ColorScheme.light(
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.grey[700]!,
          onSecondary: Colors.black,
          surface: Colors.grey[200]!,
        ),
        dividerColor: Colors.grey[300],
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>(
            create: (context) => getIt<CartBloc>(),
          ),
          BlocProvider<ProductBloc>(
            create: (context) => getIt<ProductBloc>(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
