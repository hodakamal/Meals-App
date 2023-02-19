// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mealsapp/models/dummy_data.dart';
import 'package:mealsapp/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories_screen';

  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: DUMMY_CATEGORIES
          .map((e) => CategoryItemm(
                title: e.title,
                color: e.color,
                id: e.id,
              ))
          .toList(),
    );
  }
}
