import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals_list_screen.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(this.category, this.availableMeals, this.toogleFavorite);

  final Category category;
  final List<Meal> availableMeals;
  final void Function(Meal meal) toogleFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(16),
      onTap: (){
        List<Meal> pickedMeals = (availableMeals.where( (meal) => meal.categories.contains(category.id))).toList() ;
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return MealsListScreen(meal_items: pickedMeals, title: category.title, toogleFavorite: toogleFavorite,);
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
