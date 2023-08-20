import 'package:flutter/material.dart';
import 'package:ranna_banna/provider/meal_provider.dart';
import 'package:ranna_banna/screen/category.dart';
import 'package:ranna_banna/screen/filter_screen.dart';
import 'package:ranna_banna/screen/meals.dart';
import 'package:ranna_banna/widget/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ranna_banna/provider/favorites_provider.dart';
import 'package:ranna_banna/provider/filter_provider.dart';

const kInitialFilters = {
  Filter.halal: false,
  Filter.glutenFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedIndex = 0;

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setScreen(String identifire) async {
    if (identifire == 'home') {
      if (_selectedIndex == 0) {
        Navigator.of(context).pop();
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const TabScreen(),
          ),
        );
      }
    } else {
      Navigator.of(context).pop();
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filterProvider);
    final availableMeals = meals.where((meal) {
      if (activeFilters[Filter.halal]! && !meal.isHalal) {
        return false;
      }
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoryScreen(
      availableMeal: availableMeals,
    );
    String activePageTitle = 'ক্যাটাগরি পছন্দ করুন';
    if (_selectedIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'প্রিয় রেসিপি';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Categories',
              backgroundColor: Colors.lightGreenAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
              backgroundColor: Colors.deepPurple),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
        selectedItemColor: Colors.amber,
      ),
    );
  }
}
