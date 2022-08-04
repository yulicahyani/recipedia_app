import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipedia_app/colors/color_custom.dart';
import 'package:recipedia_app/model/recipe.dart';
import 'package:recipedia_app/model/recipe_api.dart';
import 'package:recipedia_app/views/detail_recipe.dart';
import 'package:recipedia_app/views/search_result.dart';
import 'package:recipedia_app/widget/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> recipe;
  bool isLoading = true;

  Future<void> getRecipe() async {
    recipe = await RecipeApi.getRecipe();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getRecipe();
  }

  TextEditingController searchValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Find",
                              style: TextStyle(
                                  color: ColorCustoms.blueberry,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Inter"),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Best Recipes",
                              style: TextStyle(
                                  color: ColorCustoms.yellow,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Inter"),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "For Cooking",
                          style: TextStyle(
                              color: ColorCustoms.blueberry,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter"),
                        ),
                      ],
                    ),
                    const Image(image: AssetImage("assets/images/logo.png"))
                  ],
                ),
              ),
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: TextField(
                  controller: searchValue,
                  onSubmitted: (value) async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchResultPage(
                            searchValue: searchValue.text,
                          ),
                        ));
                    searchValue.clear();
                  },
                  style: const TextStyle(color: ColorCustoms.blueberry),
                  decoration: InputDecoration(
                      hintText: "Search recipes here",
                      prefixIcon: const Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              width: 1, color: ColorCustoms.yellow)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              width: 1, color: ColorCustoms.yellow))),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Text("Ingredients",
                      style: TextStyle(
                          color: ColorCustoms.blueberry,
                          fontSize: 20,
                          fontWeight: FontWeight.w500))),
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 115,
                          height: 100,
                          child: Card(
                            elevation: 5.0,
                            shadowColor: ColorCustoms.black.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    color:
                                        ColorCustoms.yellow.withOpacity(0.25))),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SearchResultPage(
                                        searchValue: "Chicken",
                                      ),
                                    ));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Image(
                                    image:
                                        AssetImage("assets/images/chicken.png"),
                                    width: 67,
                                    height: 66,
                                  ),
                                  Text(
                                    "Chicken",
                                    style: TextStyle(
                                      color: ColorCustoms.blueberry,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 115,
                          height: 100,
                          child: Card(
                            elevation: 5.0,
                            shadowColor: ColorCustoms.black.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    color:
                                        ColorCustoms.yellow.withOpacity(0.25))),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SearchResultPage(
                                        searchValue: "Pasta",
                                      ),
                                    ));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Image(
                                    image:
                                        AssetImage("assets/images/pasta.png"),
                                    width: 67,
                                    height: 66,
                                  ),
                                  Text(
                                    "Pasta",
                                    style: TextStyle(
                                      color: ColorCustoms.blueberry,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 115,
                          height: 100,
                          child: Card(
                            elevation: 5.0,
                            shadowColor: ColorCustoms.black.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    color:
                                        ColorCustoms.yellow.withOpacity(0.25))),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SearchResultPage(
                                        searchValue: "Potato",
                                      ),
                                    ));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Image(
                                    image:
                                        AssetImage("assets/images/potato.png"),
                                    width: 67,
                                    height: 66,
                                  ),
                                  Text(
                                    "Potato",
                                    style: TextStyle(
                                      color: ColorCustoms.blueberry,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 115,
                          height: 100,
                          child: Card(
                            elevation: 5.0,
                            shadowColor: ColorCustoms.black.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    color:
                                        ColorCustoms.yellow.withOpacity(0.25))),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SearchResultPage(
                                        searchValue: "Chocolate",
                                      ),
                                    ));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/chocolate.png"),
                                    width: 67,
                                    height: 66,
                                  ),
                                  Text(
                                    "Chocolate",
                                    style: TextStyle(
                                      color: ColorCustoms.blueberry,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 115,
                          height: 100,
                          child: Card(
                            elevation: 5.0,
                            shadowColor: ColorCustoms.black.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    color:
                                        ColorCustoms.yellow.withOpacity(0.25))),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SearchResultPage(
                                        searchValue: "Beef",
                                      ),
                                    ));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Image(
                                    image: AssetImage("assets/images/beef.png"),
                                    width: 67,
                                    height: 66,
                                  ),
                                  Text(
                                    "Ground Beef",
                                    style: TextStyle(
                                      color: ColorCustoms.blueberry,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Text("Recipes",
                      style: TextStyle(
                          color: ColorCustoms.blueberry,
                          fontSize: 20,
                          fontWeight: FontWeight.w500))),
            ),
            isLoading
                ? const Padding(
                    padding: EdgeInsets.only(
                      top: 80,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: ColorCustoms.yellow,
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: recipe.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailRecipePage(
                                        recipe: recipe[index],
                                      )));
                        },
                        child: RecipeCard(
                            name: recipe[index].name,
                            cookTime: recipe[index].cookTime,
                            rating: recipe[index].rating,
                            imageUrl: recipe[index].imageUrl),
                      );
                    }),
          ],
        ),
      ),
    );
  }
}
