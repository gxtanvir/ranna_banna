import 'package:flutter/material.dart';
import 'package:ranna_banna/model/meal.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({
    super.key,
    required this.meal,
  });
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const Icon(Icons.schedule),
            const SizedBox(
              width: 8,
            ),
            Text(
              meal.duration.toString(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        Row(
          children: [
            const Icon(Icons.work),
            const SizedBox(
              width: 8,
            ),
            Text(
              meal.affordability.name.toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        Row(
          children: [
            const Icon(
              Icons.attach_money,
              color: Colors.white,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              meal.affordability.name.toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        )
      ],
    );
  }
}
