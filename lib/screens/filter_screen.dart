import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilter});

  final Map<Filter, bool> currentFilter;


  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late bool _glutenFreeCheck;
  late bool _lactoseFreeCheck;
  late bool _vegetarianCheck;
  late bool _veganCheck;

  @override
  void initState() {
    _glutenFreeCheck = widget.currentFilter[Filter.glutenFree]!;
    _lactoseFreeCheck = widget.currentFilter[Filter.lactoseFree]!;
    _vegetarianCheck = widget.currentFilter[Filter.vegetarian]!;
    _veganCheck = widget.currentFilter[Filter.vegan]!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Filter',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeCheck,
            Filter.lactoseFree: _lactoseFreeCheck,
            Filter.vegetarian: _vegetarianCheck,
            Filter.vegan: _veganCheck,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeCheck,
              onChanged: (bool value) {
                setState(() {
                  _glutenFreeCheck = value;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text('Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              // contentPadding: EdgeInsets.onl,
            ),
            SwitchListTile(
              value: _lactoseFreeCheck,
              onChanged: (bool value) {
                setState(() {
                  _lactoseFreeCheck = value;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text('Only include lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              // contentPadding: EdgeInsets.onl,
            ),
            SwitchListTile(
              value: _vegetarianCheck,
              onChanged: (bool value) {
                setState(() {
                  _vegetarianCheck = value;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text('Only include vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              // contentPadding: EdgeInsets.onl,
            ),
            SwitchListTile(
              value: _veganCheck,
              onChanged: (bool value) {
                setState(() {
                  _veganCheck = value;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text('Only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              // contentPadding: EdgeInsets.onl,
            ),

          ],
        ),
      ),
    );
  }
}
