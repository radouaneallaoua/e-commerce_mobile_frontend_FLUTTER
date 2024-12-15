
class SizeModel {
  int id;
  String label;
  SizeModel({required this.id, required this.label});

  factory SizeModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'label': String label,
      } =>
        SizeModel(
          id: id,
          label: label,
        ),
      _ => throw const FormatException('Failed to load size.'),
    };
  }
}
