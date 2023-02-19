// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mealsapp/providers/updates.dart';
import 'package:mealsapp/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class CategoryMeals extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  const CategoryMeals({
    super.key,
    required this.categoryId,
    required this.categoryTitle,
  });
  @override
  Widget build(BuildContext context) {
    final availableMeals = Provider.of<UpdateData>(context).items;
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ChangeNotifierProvider.value(
              value: categoryMeals[index],
              child: MealItem(
                  id: categoryMeals[index].id,
                  title: categoryMeals[index].title,
                  imageUrl: categoryMeals[index].imageUrl,
                  duration: categoryMeals[index].duration,
                  complexity: categoryMeals[index].complexity,
                  affordability: categoryMeals[index].affordability),
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
