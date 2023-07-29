import 'package:flutter/material.dart';
import 'package:ranna_banna/screen/category.dart';
import 'package:ranna_banna/screen/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoryScreen();
    String activePageTitle = 'ক্যাটাগরি পছন্দ করুন';
    if (_selectedIndex == 1) {
      activePage = const MealScreen(meals: []);
      activePageTitle = 'প্রিয় রেসিপি';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
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
