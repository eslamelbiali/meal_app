import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            child: Text(
              'Cooking up!',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontFamily: 'Raleway',
              ),
            ),
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            leading: Icon(
              Icons.restaurant,
              size: 25,
            ),
            title: Text(
              'Meal',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 25,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            },
            leading: Icon(
              Icons.settings,
              size: 25,
            ),
            title: Text(
              'Filters',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
