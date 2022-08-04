import 'package:flutter/material.dart';

import '../colors/color_custom.dart';
import '../model/recipe.dart';
import '../model/recipe_api.dart';
import '../widget/recipe_card.dart';
import 'detail_recipe.dart';

class SearchResultPage extends StatefulWidget {
  final String? searchValue;

  const SearchResultPage({super.key, this.searchValue});

  @override
  // ignore: no_logic_in_create_state
  State<SearchResultPage> createState() => _SearchResultPage(searchValue);
}

class _SearchResultPage extends State<SearchResultPage> {
  final String? searchQuery;

  late List<Recipe> recipes;
  bool isLoading = true;

  _SearchResultPage(this.searchQuery);

  Future<void> getRecipe(String query) async {
    recipes = await RecipeApi.getRecipeSearch(query.toLowerCase());
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getRecipe(searchQuery!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(searchQuery!),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorCustoms.yellow,
                ),
              )
            : ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailRecipePage(
                                    recipe: recipes[index],
                                  )));
                    },
                    child: RecipeCard(
                        name: recipes[index].name,
                        cookTime: recipes[index].cookTime,
                        rating: recipes[index].rating,
                        imageUrl: recipes[index].imageUrl),
                  );
                }));
  }
}
