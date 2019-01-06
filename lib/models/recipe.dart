class Recipe {
  Recipe({
    this.imageUrl,
    this.title,
    this.description,
    this.ratting,
    List<String> ingredients,
    List<String> images,
  })  : this.ingredients = ingredients == null ? [] : ingredients,
        this.images = images == null ? [] : images;

  final String imageUrl;
  final String title;
  final String description;
  final double ratting;
  final List<String> ingredients;
  final List<String> images;
}
