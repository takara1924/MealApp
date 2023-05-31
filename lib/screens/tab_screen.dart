import 'package:flutter/material.dart';
import 'package:meals_app/data/meals_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meals_list_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/screens/filter_screen.dart';

Map<Filter, bool> initFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Meal> favoriteMeals = [];
  int currentPage = 0;
  Map<Filter, bool> selectedFilter = initFilter;

  void setScreen(String screen) async {
    Navigator.of(context).pop();
    if (screen == 'meals') {
    } else {
      // Navigator.of(context).pop();
      final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
              builder: (ctx) => FilterScreen(
                    currentFilter: selectedFilter,
                  )));
      setState(() {
        selectedFilter = result ?? initFilter;
      });
    }
  }

  void changeContent(int index) {
    setState(() {
      currentPage = index;
    });
  }

  void toogleFavorite(Meal meal) {
    setState(() {
      if (favoriteMeals.contains(meal)) {
        favoriteMeals.remove(meal);
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Meal is no longer a favorite'),
          duration: Duration(seconds: 2),
        ));
      } else {
        favoriteMeals.add(meal);
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Marked as favorite'),
          duration: Duration(seconds: 2),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
        availableMeals: availableMeals, toogleFavorite: toogleFavorite);
    String title = 'Categories';

    if (currentPage == 1) {
      activePage = MealsListScreen(
        meal_items: favoriteMeals,
        toogleFavorite: toogleFavorite,
      );
      title = 'Your Favorite';
    }

    return Scaffold(
      drawer: MainDrawer(currentFilter: selectedFilter, setScreen: setScreen),
      appBar: AppBar(
        title: Text(title),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          changeContent(index);
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
