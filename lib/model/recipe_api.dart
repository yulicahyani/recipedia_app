// const req = unirest("GET", "https://tasty.p.rapidapi.com/recipes/list");

// req.query({
// "from": "0",
// "size": "20",
// "tags": "under_30_minutes",
// "q": "beef"
// });

// req.headers({
// "X-RapidAPI-Key": "b3d0a3183bmsh829a4f759cdadcbp1c76ccjsn16e327df0ec9",
// "X-RapidAPI-Host": "tasty.p.rapidapi.com",
// "useQueryString": true
// });

import 'dart:convert';
import 'package:recipedia_app/model/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var url = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": "0", "size": "20", "tags": "under_30_minutes"});

    final response = await http.get(url, headers: {
      "X-RapidAPI-Key": "b3d0a3183bmsh829a4f759cdadcbp1c76ccjsn16e327df0ec9",
      "X-RapidAPI-Host": "tasty.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);

    List temp = [];

    for (var i in data['results']) {
      temp.add(i);
    }

    return Recipe.recipeFromSnapshot(temp);
  }

  static Future<List<Recipe>> getRecipeSearch(String query) async {
    var url = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": "0", "size": "10", "tags": "under_30_minutes", "q": query});

    final response = await http.get(url, headers: {
      "X-RapidAPI-Key": "b3d0a3183bmsh829a4f759cdadcbp1c76ccjsn16e327df0ec9",
      "X-RapidAPI-Host": "tasty.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);

    List temp = [];

    for (var i in data['results']) {
      temp.add(i);
    }

    return Recipe.recipeFromSnapshot(temp);
  }

  static Future<List<Recipe>> getSimilarRecipe(String id) async {
    var url = Uri.https('tasty.p.rapidapi.com', '/recipes/list-similarities',
        {"recipe_id": id});

    final response = await http.get(url, headers: {
      "X-RapidAPI-Key": "b3d0a3183bmsh829a4f759cdadcbp1c76ccjsn16e327df0ec9",
      "X-RapidAPI-Host": "tasty.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);

    List temp = [];

    for (var i in data['results']) {
      temp.add(i);
    }

    return Recipe.recipeFromSnapshot(temp);
  }
}
