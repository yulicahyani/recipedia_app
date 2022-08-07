class Component {
  final String rawText;

  Component({required this.rawText});

  factory Component.fromJson(Map<String, dynamic> json) =>
      Component(rawText: json['raw_text'] ?? '');
}

class Ingredient {
  final List<Component> components;

  Ingredient({required this.components});

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        components: json['components'] != null
            ? List<Component>.from(
                json["components"].map((x) => Component.fromJson(x)))
            : [],
      );
}

class Instruction {
  final String displayText;

  Instruction({required this.displayText});

  factory Instruction.fromJson(Map<String, dynamic> json) =>
      Instruction(displayText: json['display_text'] ?? '');
}

class Nutrition {
  final String carbohydrates;
  final String fiber;
  final String protein;
  final String fat;
  final String calories;
  final String sugar;

  Nutrition(
      {required this.carbohydrates,
      required this.fiber,
      required this.protein,
      required this.fat,
      required this.calories,
      required this.sugar});

  factory Nutrition.fromJson(dynamic json) => Nutrition(
        carbohydrates: json["carbohydrates"] != null
            ? '${json["carbohydrates"]}g'
            : "No info",
        fiber: json["fiber"] != null ? '${json["fiber"]}g' : "No info",
        protein: json["protein"] != null ? '${json["protein"]}g' : "No info",
        fat: json["fat"] != null ? '${json["fat"]}g' : "No info",
        calories: json["calories"] != null ? '${json["calories"]}' : "No info",
        sugar: json["sugar"] != null ? '${json["sugar"]}g' : "No info",
      );
}

class Recipe {
  final String name;
  final String imageUrl;
  final String rating;
  final String cookTime;
  final String description;
  final String numServings;
  final int id;
  final String videoUrl;
  final List<Instruction> instructions;
  final List<Ingredient> ingredients;
  final Nutrition nutrition;

  Recipe(
      {required this.name,
      required this.imageUrl,
      required this.rating,
      required this.cookTime,
      required this.description,
      required this.numServings,
      required this.id,
      required this.videoUrl,
      required this.instructions,
      required this.ingredients,
      required this.nutrition});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      name: json['name'] as String,
      imageUrl: json['thumbnail_url'] as String,
      rating: json['user_ratings']['score'] != null
          ? double.parse((json['user_ratings']['score']).toStringAsFixed(1))
              .toString()
          : "0",
      cookTime: json['total_time_minutes'] != null
          ? "${json['total_time_minutes']} Min"
          : "30 Min",
      description:
          json['description'] != null ? json['description'] : "No description",
      numServings: json['num_servings'] != null
          ? json['num_servings'].toString()
          : "No info",
      id: json['id'] as int,
      videoUrl: json['original_video_url'] ?? "No video",
      instructions: json['instructions'] != null
          ? List<Instruction>.from(
              json["instructions"].map((x) => Instruction.fromJson(x)))
          : [],
      ingredients: json['sections'] != null
          ? List<Ingredient>.from(
              json["sections"].map((x) => Ingredient.fromJson(x)))
          : [],
      nutrition: Nutrition.fromJson(json["nutrition"]) != null
          ? Nutrition.fromJson(json["nutrition"])
          : Nutrition(
              carbohydrates: "No info",
              fiber: "No info",
              protein: "No info",
              fat: "No info",
              calories: "No info",
              sugar: "No info"),
    );
  }

  static List<Recipe> recipeFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, imageUrl: $imageUrl, rating: $rating, cookTime: $cookTime, description: $description, numServings: $numServings, id: $id, videoUrl: $videoUrl}';
  }
}
