import 'dart:ui';

import 'package:flutter/material.dart';

import '../colors/color_custom.dart';
import '../widget/recipe_card.dart';

class DetailRecipePage extends StatefulWidget {
  const DetailRecipePage({Key? key}) : super(key: key);

  @override
  State<DetailRecipePage> createState() => _DetailRecipePageState();
}

class _DetailRecipePageState extends State<DetailRecipePage> {
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
                    image: const NetworkImage(
                        "https://img.buzzfeed.com/tasty-app-user-assets-prod-us-east-1/recipes/1a08783ea26843a88d3b14c938976ee0.jpeg"),
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
            const Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: Text("Nama Resep Makanan",
                    maxLines: 2,
                    style: TextStyle(
                        color: ColorCustoms.blueberry,
                        fontSize: 30,
                        fontWeight: FontWeight.bold))),
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
                        children: const [
                          Text(
                            "Cook Time",
                            style: TextStyle(
                              color: ColorCustoms.grey,
                              fontFamily: "Inter",
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "30 Min",
                            style: TextStyle(
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
                        children: const [
                          Text(
                            "Rating",
                            style: TextStyle(
                              color: ColorCustoms.grey,
                              fontFamily: "Inter",
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "3.5",
                            style: TextStyle(
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
                        children: const [
                          Text(
                            "Serving",
                            style: TextStyle(
                              color: ColorCustoms.grey,
                              fontFamily: "Inter",
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "2 pp",
                            style: TextStyle(
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
                        itemCount: 5,
                        itemBuilder: ((context, index) {
                          return const ListTile(
                            visualDensity:
                                VisualDensity(horizontal: -4, vertical: -4),
                            horizontalTitleGap: 2.0,
                            leading: Icon(
                              Icons.circle,
                              size: 11,
                              color: ColorCustoms.yellow,
                            ),
                            title: Text(
                              "Ingredients 1",
                              style: TextStyle(fontSize: 14),
                            ),
                          );
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
                  itemCount: 5,
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
                            title: const Text(
                              "Instrutions 1 Instrutions Instrutions Instrutions Instrutions",
                              style: TextStyle(fontSize: 14),
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
              child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DetailRecipePage()));
                      },
                      child: const RecipeCard(
                          name: "Easy Beef Hand Pies",
                          cookTime: "30 min",
                          rating: "3.5",
                          imageUrl:
                              "https://img.buzzfeed.com/tasty-app-user-assets-prod-us-east-1/recipes/1a08783ea26843a88d3b14c938976ee0.jpeg"),
                    );
                  }),
            ),
          ],
        )),
      ),
    );
  }
}
