import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const FoodRescueApp());
}

class FoodRescueApp extends StatelessWidget {
  const FoodRescueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Food Rescue',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
