import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app/models/Recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        "yummly2.p.rapidapi.com", "/feeds/list", {"limit": "24", "start": "0"});

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "YOUR API KEY FROM YUMMLY API",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data["feed"]) {
      if (i['type'] == "single recipe") _temp.add(i['content']['details']);
    }

    return Recipe.recipesSnapshot(_temp);
  }
}
