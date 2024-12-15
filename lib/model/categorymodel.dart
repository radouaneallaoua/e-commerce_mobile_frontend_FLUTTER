class CategoryModel {
  int id;
  String name;
  String description;
  String imageURL;
  int? parentCategoryId;
  CategoryModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageURL,
      required this.parentCategoryId});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'description': String description,
        'imageURL': String imageURL,
        'parentCategoryId': int? parentCategoryId,
      } =>
        CategoryModel(
            id: id,
            name: name,
            description: description,
            imageURL: imageURL,
            parentCategoryId: parentCategoryId),
      _ => throw const FormatException('Failed to load category12.'),
    };
  }
}
