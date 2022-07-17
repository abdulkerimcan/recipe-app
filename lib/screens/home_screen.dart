import 'package:flutter/material.dart';
import 'package:recipe_app/models/Recipe.api.dart';
import 'package:recipe_app/widgets/recipe_container.dart';

import '../models/Recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   List<Recipe> _recipes = [];
  bool isLoading = true;
  
  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();

    setState(() {
      isLoading = false;
    });
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppbar(),
        body: ListView.builder(
            itemCount: _recipes.length,
            itemBuilder: (context, index) {
              Recipe recipe = _recipes[index];
              return isLoading ? CircularProgressIndicator() : RecipeContainer(recipe: recipe);
            }));
  }

  AppBar _buildAppbar() {
    return AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Food Recipe App"),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.restaurant_menu_outlined)
          ],
        ),
      );
  }
}
