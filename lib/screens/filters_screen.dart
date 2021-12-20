import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  static const routeName = 'filter_screen';

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;

  bool _vegan = false;

  bool _vegetarian = false;

  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];

    _vegan = widget.currentFilters['lactose'];

    _vegetarian = widget.currentFilters['vegan'];

    _lactoseFree = widget.currentFilters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
        ),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust ur meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                    title: Text('Gluten-Free'),
                    subtitle: Text('Only include gluten free meals'),
                    value: _glutenFree,
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text('vegan-Free'),
                    subtitle: Text('Only include vegan free meals'),
                    value: _vegan,
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text('vegetarian-Free'),
                    subtitle: Text('Only include vegetarian free meals'),
                    value: _vegetarian,
                    onChanged: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text('lactose-Free'),
                    subtitle: Text('Only include lactose free meals'),
                    value: _lactoseFree,
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
