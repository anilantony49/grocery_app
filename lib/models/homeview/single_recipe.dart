class SingleRecipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  SingleRecipe(
      {required this.name,
      required this.images,
      required this.rating,
      required this.totalTime});

  factory SingleRecipe.fromJson(dynamic json) {
    return SingleRecipe(
        name: json['name'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String);
        
  }
  static List<SingleRecipe> exclusiveFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return SingleRecipe.fromJson(data);
    }).toList();
  }

    @override
  String toString(){
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}

class GenericFood{
   final String images;
    final String label;

    GenericFood({required this.images,required this.label});

    factory GenericFood.fromJson(dynamic json){
      return GenericFood(
        images: json['image'] as String, 
        label: json['label'] as String);
    }

    static List<GenericFood>genericFoodFromSnapshot(List snapshot){
       return snapshot.map((data) {
      return GenericFood.fromJson(data);
    }).toList();
    }
     @override
  String toString(){
    return 'Recipe { image: $images, label : $label}';
  }

}