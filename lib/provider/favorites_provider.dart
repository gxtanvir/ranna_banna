import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ranna_banna/model/meal.dart';

class FavoriteMealsNotifer extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifer() : super([]);

  void togleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifer, List<Meal>>((ref) {
  return FavoriteMealsNotifer();
});
