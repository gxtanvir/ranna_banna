import 'package:flutter/material.dart';
import 'package:ranna_banna/model/meal.dart';
import 'package:ranna_banna/provider/meal_provider.dart';
import 'package:ranna_banna/screen/category.dart';
import 'package:ranna_banna/screen/filter_screen.dart';
import 'package:ranna_banna/screen/meals.dart';
import 'package:ranna_banna/widget/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  final List<Meal> _favoriteMeal = [];
  Map<Filter, bool> _selectedFilter = kInitialFilters;

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showInfoMessage(String text) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _toggleFavorite(Meal meal) {
    if (_favoriteMeal.contains(meal)) {
      setState(() {
        _favoriteMeal.remove(meal);
      });
      _showInfoMessage('ফেভারিট থেকে রিমুভ করা হয়েছে।');
    } else {
      setState(() {
        _favoriteMeal.add(meal);
      });
      _showInfoMessage('ফেভারিটে যোগ করা হয়েছে!');
    }
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
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(currentFilter: _selectedFilter),
        ),
      );
      setState(() {
        _selectedFilter = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((meal) {
      if (_selectedFilter[Filter.halal]! && !meal.isHalal) {
        return false;
      }
      if (_selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoryScreen(
      onToggleFavorite: _toggleFavorite,
      availableMeal: availableMeals,
    );
    String activePageTitle = 'ক্যাটাগরি পছন্দ করুন';
    if (_selectedIndex == 1) {
      activePage = MealScreen(
        meals: _favoriteMeal,
        onToggleFavorite: _toggleFavorite,
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
