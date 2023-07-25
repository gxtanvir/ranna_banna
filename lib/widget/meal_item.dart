import 'package:flutter/material.dart';
import 'package:ranna_banna/model/meal.dart';
import 'package:ranna_banna/widget/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
  });
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: Stack(children: [
        FadeInImage(
          placeholder: MemoryImage(kTransparentImage),
          image: NetworkImage(meal.imageUrl),
          fit: BoxFit.cover,
          width: double.infinity,
          height: 220,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.black54,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  meal.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                MealItemTrait(meal: meal)
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
