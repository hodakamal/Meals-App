import 'package:flutter/material.dart';
import 'package:mealsapp/providers/updates.dart';
import 'package:mealsapp/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteList = Provider.of<UpdateData>(context).favorites;
    return Scaffold(
      body: ListView.builder(
        itemCount: favoriteList.length,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: favoriteList[index],
            child: MealItem(
                id: favoriteList[index].id,
                title: favoriteList[index].title,
                imageUrl: favoriteList[index].imageUrl,
                duration: favoriteList[index].duration,
                complexity: favoriteList[index].complexity,
                affordability: favoriteList[index].affordability),
          );
        },
      ),
    );
  }
}
