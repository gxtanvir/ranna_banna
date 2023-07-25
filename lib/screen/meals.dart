import 'package:flutter/material.dart';
import 'package:ranna_banna/model/meal.dart';
import 'package:ranna_banna/widget/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    required this.title,
    required this.meals,
  });
  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(meal: meals[index]),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'দুঃখিত! রেসিপি পাওয়া যাচ্ছে না।',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'দয়া করে অন্য ক্যাটাগরি পছন্দ করুন।',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 22),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
