import 'package:flutter/material.dart';
import 'package:mealsapp/models/dummy_data.dart';
import 'package:mealsapp/providers/meal.dart';
import 'package:mealsapp/providers/updates.dart';
import 'package:provider/provider.dart';

class MealDetailScreen extends StatelessWidget {
  final String mealId;
  const MealDetailScreen({super.key, required this.mealId});

  Widget buildSectionTitle(BuildContext cxt, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(cxt).textTheme.displayLarge,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Meal>(context);
    final update = Provider.of<UpdateData>(context);
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          selectedMeal.ingredients[index],
                          style: const TextStyle(color: Colors.white),
                        )),
                  );
                },
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Text(
                            '# ${index + 1}',
                            style: const TextStyle(color: Colors.white),
                          )),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          data.toggleFavoriteStatue();
          update.updateFavorite();
        },
        child: Icon(data.isFavorite ? Icons.favorite : Icons.favorite_border),
      ),
    );
  }
}
