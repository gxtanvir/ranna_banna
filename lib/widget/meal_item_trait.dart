import 'package:flutter/material.dart';
import 'package:ranna_banna/model/meal.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({
    super.key,
    required this.meal,
  });
  final Meal meal;

  get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  get afforadbilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const Icon(Icons.schedule),
            const SizedBox(
              width: 8,
            ),
            Text(
              '${meal.duration.toString()} min',
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
              complexityText,
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
              afforadbilityText,
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
