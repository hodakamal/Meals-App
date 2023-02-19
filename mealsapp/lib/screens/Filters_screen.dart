// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mealsapp/providers/updates.dart';

import 'package:mealsapp/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

bool _glutenFree = false;
bool _vegetarian = false;
bool _vegan = false;
bool _lactoseFree = false;

class _FiltersScreenState extends State<FiltersScreen> {
  Widget _buildSwitch(
      String title, String subTitle, bool currentValue, final updateValue) {
    return SwitchListTile(
      onChanged: updateValue,
      title: Text(title),
      value: currentValue,
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    final setFilters = Provider.of<UpdateData>(context).setFilters;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedfilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian
                  };

                  setFilters(selectedfilters);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitch('Gluten-free', 'Only include Gluten-free meals',
                    _glutenFree, (newvalue) {
                  setState(() {
                    _glutenFree = newvalue;
                  });
                }),
                _buildSwitch('Lactose-free', 'Only include lactose-free meals',
                    _lactoseFree, (newvalue) {
                  setState(() {
                    _lactoseFree = newvalue;
                  });
                }),
                _buildSwitch(
                    'Vegetarian', 'Only include Vegetarian meals', _vegetarian,
                    (newvalue) {
                  setState(() {
                    _vegetarian = newvalue;
                  });
                }),
                _buildSwitch('Vegan', 'Only include Vegan meals', _vegan,
                    (newvalue) {
                  setState(() {
                    _vegan = newvalue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
