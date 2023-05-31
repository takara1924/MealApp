import 'package:flutter/material.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.currentFilter, required this.setScreen});
  final Map<Filter, bool> currentFilter;
  final void Function(String screen) setScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 18),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              size: 28
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24,
                  ),
            ),
            onTap: (){
              setScreen('meals');
            },
          ),
          ListTile(
            leading: const Icon(
                Icons.settings,
                size: 28
            ),
            title: Text(
              'Setting',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24,
              ),
            ),
            onTap: (){
              setScreen('');
            },
          ),
        ],
      ),
    );
  }
}
