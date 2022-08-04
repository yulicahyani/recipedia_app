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
      required this.ingredients});

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
        description: json['description'] != null
            ? json['description']
            : "No description",
        numServings: json['num_servings'] != null
            ? json['num_servings'].toString()
            : "No info",
        id: json['id'] as int,
        videoUrl: json['original_video_url'] != null
            ? json['original_video_url']
            : "No video",
        instructions: json['instructions'] != null
            ? List<Instruction>.from(
                json["instructions"].map((x) => Instruction.fromJson(x)))
            : [],
        ingredients: json['sections'] != null
            ? List<Ingredient>.from(
                json["sections"].map((x) => Ingredient.fromJson(x)))
            : []);
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
