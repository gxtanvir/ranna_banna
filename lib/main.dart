import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ranna_banna/screen/category.dart';
import 'package:ranna_banna/data/category_n_meal_data.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.lightGreenAccent, brightness: Brightness.dark),
  textTheme: GoogleFonts.balooDa2TextTheme(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const CategoryScreen(availableCategory: categorylist),
    );
  }
}
