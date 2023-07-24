enum Affordability {
  cheap,
  affordable,
  luxurious,
}

enum Filter {
  lactosfree,
  vegetarian,
  vegan,
  halal,
}

class Meal {
  const Meal({
    required this.id,
    required this.affordability,
    required this.filter,
    required this.category,
    required this.title,
    required this.imageUrl,
    required this.ingradiants,
    required this.steps,
  });
  final String id;
  final Affordability affordability;
  final Filter filter;
  final String category;
  final String title;
  final String imageUrl;
  final List<String> ingradiants;
  final List<String> steps;
}
