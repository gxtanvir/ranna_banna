import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ranna_banna/data/category_n_meal_data.dart';

final mealsProvider = Provider((ref) {
  return mealList;
});
