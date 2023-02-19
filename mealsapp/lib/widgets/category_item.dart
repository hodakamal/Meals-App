// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mealsapp/shared/MyApplication.dart';
import 'package:mealsapp/screens/categorymeals_screen.dart';

class CategoryItemm extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItemm(
      {super.key, required this.title, required this.color, required this.id});
  void selectCategory(BuildContext cxt) {
    myApplication.navigateTo(
        CategoryMeals(
          categoryId: id,
          categoryTitle: title,
        ),
        cxt);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.5), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
