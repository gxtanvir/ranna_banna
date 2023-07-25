enum Affordability {
  cheap,
  affordable,
  luxurious,
}

enum Complexity { easy, medium, hard }

class Meal {
  const Meal({
    required this.id,
    required this.affordability,
    required this.complexity,
    required this.duration,
    required this.category,
    required this.title,
    required this.imageUrl,
    required this.ingradiants,
    required this.steps,
    required this.isHalal,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
  });
  final String id;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  final String category;
  final String title;
  final String imageUrl;
  final List<String> ingradiants;
  final List<String> steps;
  final bool isHalal;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
}
