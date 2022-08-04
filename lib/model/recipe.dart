class Recipe {
  final String name;
  final String imageUrl;
  final String rating;
  final String cookTime;
  final String description;
  final String numServings;
  final int id;
  final String videoUrl;

  Recipe(
      {required this.name,
      required this.imageUrl,
      required this.rating,
      required this.cookTime,
      required this.description,
      required this.numServings,
      required this.id,
      required this.videoUrl});

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
        description: json['description'] ?? "No description",
        numServings: json['num_servings'] != null
            ? json['num_servings'].toString()
            : "No info",
        id: json['id'] as int,
        videoUrl: json['video_url'] ?? "No video");
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
