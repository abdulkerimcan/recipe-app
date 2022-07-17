// ignore_for_file: public_member_api_docs, sort_constructors_first
class Recipe {
  final String name;
  final String img;
  final double rating;
  final String time;
  Recipe({
    required this.name,
    required this.img,
    required this.rating,
    required this.time,
  });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(name: json["name"] as String, img: json['images'][0]['hostedLargeUrl'] as String, rating: json["rating"] as double, time: json["totalTime"] as String);
  }

  static List<Recipe> recipesSnapshot(List recipesSnapshot) {
    return recipesSnapshot.map((e) {
      return Recipe.fromJson(e);
    }).toList();
  }
    @override
  String toString(){
    return 'Recipe {name: $name, image: $img, rating: $rating, totalTime: $time}';
  }
}

