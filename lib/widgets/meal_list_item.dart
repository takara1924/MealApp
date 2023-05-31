import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({super.key, required this.meal, required this.toogleFavorite});

  final Meal meal;
  final void Function(Meal meal) toogleFavorite;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => MealDetailScreen(meal: meal, toogleFavorite: toogleFavorite,))
          );
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 44,
                ),
                color: Colors.black45,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 18,
                          ),
                    ),
                    const SizedBox(height:8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(width: 12,),
                        MealItemTrait(
                          icon: Icons.work,
                          label: '${meal.complexity.name}',
                        ),
                        const SizedBox(width: 12,),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: '${meal.affordability.name}',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
