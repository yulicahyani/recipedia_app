import 'dart:ui';

import 'package:flutter/material.dart';

import '../colors/color_custom.dart';
import '../model/recipe.dart';
import '../model/recipe_api.dart';
import '../widget/recipe_card.dart';

class DetailRecipePage extends StatefulWidget {
  final Recipe recipe;
  const DetailRecipePage({Key? key, required this.recipe}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<DetailRecipePage> createState() => _DetailRecipePageState(recipe);
}

class _DetailRecipePageState extends State<DetailRecipePage> {
  final Recipe recipe;

  _DetailRecipePageState(this.recipe);

  late final List<Recipe> recipes;
  bool isLoading = true;

  Future<void> getSimilarRecipe(String id) async {
    recipes = await RecipeApi.getSimilarRecipe(id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getSimilarRecipe(recipe.id.toString());
    print(recipe.ingredients.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Detail Recipe"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 272,
              decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        offset: const Offset(0.0, 10.0),
                        blurRadius: 5.0,
                        spreadRadius: -8.0),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(recipe.imageUrl),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.25), BlendMode.multiply),
                    fit: BoxFit.cover,
                  )),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: GestureDetector(
                    onTap: () {
                      print("tap video play");
                    },
                    child: const Icon(
                      Icons.play_circle,
                      color: ColorCustoms.yellow,
                      size: 80,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  recipe.name,
                  maxLines: 2,
                  style: const TextStyle(
                      color: ColorCustoms.blueberry,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Cook Time",
                            style: TextStyle(
                              color: ColorCustoms.grey,
                              fontFamily: "Inter",
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            recipe.cookTime,
                            style: const TextStyle(
                              color: ColorCustoms.yellow,
                              fontFamily: "Inter",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Rating",
                            style: TextStyle(
                              color: ColorCustoms.grey,
                              fontFamily: "Inter",
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            recipe.rating,
                            style: const TextStyle(
                              color: ColorCustoms.yellow,
                              fontFamily: "Inter",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Serving",
                            style: TextStyle(
                              color: ColorCustoms.grey,
                              fontFamily: "Inter",
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${recipe.numServings} pp',
                            style: const TextStyle(
                              color: ColorCustoms.yellow,
                              fontFamily: "Inter",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    color: ColorCustoms.lightGrey,
                  ),
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Text("Description",
                    style: TextStyle(
                        color: ColorCustoms.blueberry,
                        fontSize: 20,
                        fontWeight: FontWeight.w500))),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: recipe.description == "No descriptions"
                          ? Text(recipe.description)
                          : Text("No description")),
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Text("Ingredients",
                    style: TextStyle(
                        color: ColorCustoms.blueberry,
                        fontSize: 20,
                        fontWeight: FontWeight.w500))),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: recipe.ingredients.length,
                        itemBuilder: ((context, index) {
                          // return ListTile(
                          //   visualDensity: const VisualDensity(
                          //       horizontal: -4, vertical: -4),
                          //   horizontalTitleGap: 2.0,
                          //   leading: const Icon(
                          //     Icons.circle,
                          //     size: 11,
                          //     color: ColorCustoms.yellow,
                          //   ),
                          //   title: Text(
                          //     recipe
                          //         .ingredients[index].components[index].rawText,
                          //     style: const TextStyle(fontSize: 14),
                          //   ),
                          // );
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  recipe.ingredients[index].components.length,
                              itemBuilder: ((context, index1) {
                                return ListTile(
                                  visualDensity: const VisualDensity(
                                      horizontal: -4, vertical: -4),
                                  horizontalTitleGap: 2.0,
                                  leading: const Icon(
                                    Icons.circle,
                                    size: 11,
                                    color: ColorCustoms.yellow,
                                  ),
                                  title: Text(
                                    recipe.ingredients[index].components[index1]
                                        .rawText,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                );
                              }));
                        })),
                  ),
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Text("Instructions",
                    style: TextStyle(
                        color: ColorCustoms.blueberry,
                        fontSize: 20,
                        fontWeight: FontWeight.w500))),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recipe.instructions.length,
                  itemBuilder: ((context, index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                            horizontalTitleGap: 2.0,
                            leading: Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                  color: ColorCustoms.yellow, fontSize: 20),
                            ),
                            title: Text(
                              recipe.instructions[index].displayText,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    );
                  })),
            ),
            const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Text("Nutritions",
                    style: TextStyle(
                        color: ColorCustoms.blueberry,
                        fontSize: 20,
                        fontWeight: FontWeight.w500))),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: const [
                        ListTile(
                          visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                          horizontalTitleGap: 2.0,
                          leading: Icon(
                            Icons.circle,
                            size: 11,
                            color: ColorCustoms.yellow,
                          ),
                          title: Text(
                            "Calories",
                            style: TextStyle(fontSize: 14),
                          ),
                          trailing: Text(
                            "100",
                            style: TextStyle(
                                color: ColorCustoms.yellow, fontSize: 16),
                          ),
                        ),
                        ListTile(
                          visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                          horizontalTitleGap: 2.0,
                          leading: Icon(
                            Icons.circle,
                            size: 11,
                            color: ColorCustoms.yellow,
                          ),
                          title: Text(
                            "Fat",
                            style: TextStyle(fontSize: 14),
                          ),
                          trailing: Text(
                            "16g",
                            style: TextStyle(
                                color: ColorCustoms.yellow, fontSize: 16),
                          ),
                        ),
                        ListTile(
                          visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                          horizontalTitleGap: 2.0,
                          leading: Icon(
                            Icons.circle,
                            size: 11,
                            color: ColorCustoms.yellow,
                          ),
                          title: Text(
                            "Carbs",
                            style: TextStyle(fontSize: 14),
                          ),
                          trailing: Text(
                            "20g",
                            style: TextStyle(
                                color: ColorCustoms.yellow, fontSize: 16),
                          ),
                        ),
                        ListTile(
                          visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                          horizontalTitleGap: 2.0,
                          leading: Icon(
                            Icons.circle,
                            size: 11,
                            color: ColorCustoms.yellow,
                          ),
                          title: Text(
                            "Fiber",
                            style: TextStyle(fontSize: 14),
                          ),
                          trailing: Text(
                            "25g",
                            style: TextStyle(
                                color: ColorCustoms.yellow, fontSize: 16),
                          ),
                        ),
                        ListTile(
                          visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                          horizontalTitleGap: 2.0,
                          leading: Icon(
                            Icons.circle,
                            size: 11,
                            color: ColorCustoms.yellow,
                          ),
                          title: Text(
                            "Sugar",
                            style: TextStyle(fontSize: 14),
                          ),
                          trailing: Text(
                            "10g",
                            style: TextStyle(
                                color: ColorCustoms.yellow, fontSize: 16),
                          ),
                        ),
                        ListTile(
                          visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                          horizontalTitleGap: 2.0,
                          leading: Icon(
                            Icons.circle,
                            size: 11,
                            color: ColorCustoms.yellow,
                          ),
                          title: Text(
                            "Protein",
                            style: TextStyle(fontSize: 14),
                          ),
                          trailing: Text(
                            "32g",
                            style: TextStyle(
                                color: ColorCustoms.yellow, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Text("Similar Recipes",
                    style: TextStyle(
                        color: ColorCustoms.blueberry,
                        fontSize: 20,
                        fontWeight: FontWeight.w500))),
            SizedBox(
              height: 250,
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: ColorCustoms.yellow,
                      ),
                    )
                  : ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
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
                      }),
            ),
          ],
        )),
      ),
    );
  }
}
