import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritesMeal;

  FavoriteScreen(this.favoritesMeal);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeal.isEmpty) {
      return Center(
        child: Text('No Favorites Meals !'),
      );
    } else {
      return ListView.builder(
          itemCount: favoritesMeal.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favoritesMeal[index].id,
              title: favoritesMeal[index].title,
              duration: favoritesMeal[index].duration,
              affordability: favoritesMeal[index].affordability,
              complexity: favoritesMeal[index].complexity,
              imageUrl: favoritesMeal[index].imageUrl,
            );
          });
    }
  }
}
