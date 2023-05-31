import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal, required this.toogleFavorite});

  final Meal meal;
  final void Function(Meal meal) toogleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          maxLines: 1,
          overflow: TextOverflow.clip,
        ),
        actions: [
          IconButton(
            onPressed: () {
              toogleFavorite(meal);
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl),
            const SizedBox(height: 8),
            Text(
              'Ingredient',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            for (String text in meal.ingredients)
              Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            const SizedBox(height: 14),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            for (String text in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12,),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
            const SizedBox(height: 14),

          ],
        ),
      ),
    );
  }
}
