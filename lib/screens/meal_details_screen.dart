import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const routeName = 'meal_details';
  final Function toggleFav;
  final Function isFav;

  MealDetails(this.toggleFav, this.isFav);

  Container buildContainer1(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20.0),
      ),
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      child: child,
    );
  }

  Container buildContainer(BuildContext context, String text) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildContainer(context, 'Ingredients'),
            buildContainer1(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildContainer(context, 'Steps'),
            buildContainer1(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      title: Text(selectedMeal.steps[index]),
                      leading: CircleAvatar(
                        child: Text("# ${index + 1}"),
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFav(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFav(mealId),
      ),
    );
  }
}
