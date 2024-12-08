

class RecipeData {
  int? id;
  String? name;
  String? description;
  String? image;
  List<String>? ingredients;
  List<String>? instructions;

  RecipeData(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.ingredients,
        this.instructions});

  RecipeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    ingredients = json['ingredients'].cast<String>();
    instructions = json['instructions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['ingredients'] = this.ingredients;
    data['instructions'] = this.instructions;
    return data;
  }
}
