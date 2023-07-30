import 'package:flutter/material.dart';
import 'package:ranna_banna/model/meal.dart';
import 'package:ranna_banna/screen/category.dart';
import 'package:ranna_banna/screen/filter_screen.dart';
import 'package:ranna_banna/screen/meals.dart';
import 'package:ranna_banna/widget/main_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;
  final List<Meal> _favoriteMeal = [];

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

  void _setScreen(String identifire) {
    if (identifire == 'home') {
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (ctx) => TabScreen(),
      //   ),
      // );
      Navigator.of(context).pop();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(
      onToggleFavorite: _toggleFavorite,
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
