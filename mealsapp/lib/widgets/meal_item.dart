import 'package:flutter/material.dart';
import 'package:mealsapp/providers/meal.dart';
import 'package:mealsapp/screens/meal_detail_screen.dart';
import 'package:mealsapp/shared/MyApplication.dart';
import 'package:provider/provider.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability});

  String get complexityText {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    }
    if (complexity == Complexity.Hard) {
      return 'Hard';
    }
    if (complexity == Complexity.Challenging) {
      return 'Challenging';
    }
    return 'Guess';
  }

  String get affordabilityText {
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    }
    if (affordability == Affordability.Luxurious) {
      return 'Luxurious';
    }
    if (affordability == Affordability.Pricey) {
      return 'Pricey';
    }
    return 'Guess';
  }

  void selectMeal(BuildContext cxt) {
    myApplication.navigateTo(
        MealDetailScreen(
          mealId: id,
        ),
        cxt);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Meal>(context);
    return InkWell(
        splashColor: Theme.of(context).colorScheme.primary,
        onTap: () => myApplication.navigateTo(
            ChangeNotifierProvider.value(
                value: data, child: MealDetailScreen(mealId: data.id)),
            context),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)),
                      child: Container(
                        width: 220,
                        color: Colors.black.withOpacity(0.5),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 6,
                        ),
                        Text('$duration min')
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(complexityText)
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(affordabilityText)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
