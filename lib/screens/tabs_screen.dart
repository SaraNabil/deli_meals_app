import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  void _selectTab(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(widget.favoriteMeals),
      'title': 'Favorites',
    }
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
          //normal tab bar//////////////////////////////////////
          // bottom: TabBar(
          // tabs: [
          //   Tab(
          //     icon: Icon(Icons.category),
          //     text: 'categories',
          //   ),
          //   Tab(
          //     icon: Icon(Icons.star),
          //     text: 'favorites',
          //   ),
          // ],
          // ),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        //bottom tab bar//////////////////////////////////////
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectTab,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ],
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
        ),
        // body: TabBarView(
        //   children: [
        //     CategoriesScreen(),
        //     FavoritesScreen(),
        //   ],
        // ),
      ),
    );
  }
}
