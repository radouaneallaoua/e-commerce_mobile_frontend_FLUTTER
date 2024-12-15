
class ColorModel {
  int id;
  String color;
  ColorModel({required this.id, required this.color});

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'color': String color,
      } =>
        ColorModel(
          id: id,
          color: color,
        ),
      _ => throw const FormatException('Failed to load color.'),
    };
  }
}
