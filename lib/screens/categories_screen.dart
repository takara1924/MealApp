import 'package:flutter/material.dart';
import 'package:meals_app/data/meals_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals, required this.toogleFavorite});

  final List<Meal> availableMeals;
  final void Function(Meal meal) toogleFavorite;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3/2,
      ),
      children: [
        for(Category category in availableCategories)
          CategoryItem(category, availableMeals, toogleFavorite)
      ],
    );
  }
}
