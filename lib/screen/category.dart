import 'package:flutter/material.dart';
import 'package:ranna_banna/data/category_n_meal_data.dart';
import 'package:ranna_banna/model/category.dart';
import 'package:ranna_banna/model/meal.dart';
import 'package:ranna_banna/screen/meals.dart';
import 'package:ranna_banna/widget/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availableMeal,
  });

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeal;

  // For Filtering Meal And Navigate to Meals Screen
  void _selectCategory(BuildContext context, Category category) {
    final filterdMeals =
        availableMeal.where((meal) => meal.category == category.id).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
            title: category.title,
            meals: filterdMeals,
            onToggleFavorite: onToggleFavorite),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        children: [
          for (final category in categorylist)
            CategoryGridItem(
              category: category,
              onselctCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
