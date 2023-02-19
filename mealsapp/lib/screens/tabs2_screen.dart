import 'package:flutter/material.dart';
import 'package:mealsapp/screens/categories_screen.dart';
import 'package:mealsapp/screens/favorites_screen.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class TabsScreenn extends StatefulWidget {
  const TabsScreenn({super.key});

  @override
  State<TabsScreenn> createState() => _TabsScreennState();
}

class _TabsScreennState extends State<TabsScreenn> {
  List<Map<String, dynamic>> _pages = [];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {'page': const FavoritesScreen(), 'title': 'Your Favorites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
              //backgroundColor: Colors.pink,
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.pink,
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ]),
    );
  }
}
