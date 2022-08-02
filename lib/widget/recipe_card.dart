import 'package:flutter/material.dart';
import 'package:recipedia_app/colors/color_custom.dart';

class RecipeCard extends StatelessWidget {
  final String name;
  final String cookTime;
  final String rating;
  final String imageUrl;

  const RecipeCard(
      {required this.name,
      required this.cookTime,
      required this.rating,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorCustoms.yellow),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.6),
                offset: Offset(0.0, 10.0),
                blurRadius: 10.0,
                spreadRadius: -6.0),
          ],
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.35), BlendMode.multiply),
            fit: BoxFit.cover,
          )),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  color: ColorCustoms.white,
                  fontFamily: "Inter",
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: ColorCustoms.yellow,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          rating,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Inter",
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          color: ColorCustoms.yellow,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          cookTime,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Inter",
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
