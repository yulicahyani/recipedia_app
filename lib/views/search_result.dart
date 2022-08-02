import 'package:flutter/material.dart';

import '../widget/recipe_card.dart';

class SearchResultPage extends StatelessWidget {
  final String? searchValue;
  const SearchResultPage({Key? key, required this.searchValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(searchValue!),
        ),
        body: const RecipeCard(
            name: "Easy Beef Hand Pies",
            cookTime: "30 min",
            rating: "3.5",
            imageUrl:
                "https://img.buzzfeed.com/tasty-app-user-assets-prod-us-east-1/recipes/1a08783ea26843a88d3b14c938976ee0.jpeg"));
  }
}
