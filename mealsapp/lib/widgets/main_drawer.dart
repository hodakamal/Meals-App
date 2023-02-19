import 'package:flutter/material.dart';
import 'package:mealsapp/screens/Filters_screen.dart';
import 'package:mealsapp/screens/tabs2_screen.dart';
import 'package:mealsapp/shared/MyApplication.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(String text, IconData icon, final tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        text,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            myApplication.navigateToReplace(const TabsScreenn(), context);
          }),
          buildListTile('Filters', Icons.settings, () {
            myApplication.navigateToReplace(const FiltersScreen(), context);
          }),
        ],
      ),
    );
  }
}
