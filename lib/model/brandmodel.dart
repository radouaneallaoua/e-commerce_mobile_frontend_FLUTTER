
class BrandModel {
  int id;
  String name;
  BrandModel({required this.id, required this.name});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
      } =>
        BrandModel(
          id: id,
          name: name,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
