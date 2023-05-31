import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_list_item.dart';

class MealsListScreen extends StatelessWidget {
  MealsListScreen({
    required this.meal_items,
    super.key,
    this.title,
    required this.toogleFavorite,
  });

  final List<Meal> meal_items;
  String? title;
  final void Function(Meal meal) toogleFavorite;

  @override
  Widget build(BuildContext context) {
    late Widget content;

    if (meal_items.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Uh oh ... nothing here!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 28,
                  ),
            ),
            const SizedBox(height:8),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 14,
                  ),
            ),
          ],
        ),
      );
    }
    else{
      content = ListView.builder(

        itemCount: meal_items.length,
        itemBuilder: (ctx, index) => MealListItem(meal: meal_items[index], toogleFavorite: toogleFavorite),
      );
    }

    if (title != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content,
      );
    } else {
      return content;
    }
  }
}
