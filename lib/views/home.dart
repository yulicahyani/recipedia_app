import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipedia_app/colors/color_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  onSubmitted: (value) {
                    print(searchValue.text);
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
                                side: BorderSide(
                                    color:
                                        ColorCustoms.yellow.withOpacity(0.25))),
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
                        Container(
                          width: 115,
                          height: 100,
                          child: Card(
                            elevation: 5.0,
                            shadowColor: ColorCustoms.black.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color:
                                        ColorCustoms.yellow.withOpacity(0.25))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage("assets/images/pasta.png"),
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
                        Container(
                          width: 115,
                          height: 100,
                          child: Card(
                            elevation: 5.0,
                            shadowColor: ColorCustoms.black.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color:
                                        ColorCustoms.yellow.withOpacity(0.25))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage("assets/images/potato.png"),
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
                                side: BorderSide(
                                    color:
                                        ColorCustoms.yellow.withOpacity(0.25))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Image(
                                  image:
                                      AssetImage("assets/images/chocolate.png"),
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
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 115,
                          height: 100,
                          child: Card(
                            elevation: 5.0,
                            shadowColor: ColorCustoms.black.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color:
                                        ColorCustoms.yellow.withOpacity(0.25))),
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
          ],
        ),
      ),
    );
  }
}
