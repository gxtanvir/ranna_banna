import 'package:flutter/material.dart';
import 'package:ranna_banna/data/category_n_meal_data.dart';
import 'package:ranna_banna/model/category.dart';
import 'package:ranna_banna/model/meal.dart';
import 'package:ranna_banna/screen/meals.dart';
import 'package:ranna_banna/widget/category_grid_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
    required this.availableMeal,
  });
  final List<Meal> availableMeal;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // For Filtering Meal And Navigate to Meals Screen
  void _selectCategory(BuildContext context, Category category) {
    final filterdMeals = widget.availableMeal
        .where((meal) => meal.category.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          title: category.title,
          meals: filterdMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Padding(
        padding: EdgeInsets.only(top: 100 - _animationController.value * 100),
        child: child,
      ),
      child: GridView(
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
