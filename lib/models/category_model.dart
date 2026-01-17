class CategoryModel {
  final int id;
  final String slug;
  final String image;
  final String name;
  final String description;

  CategoryModel({
    required this.id,
    required this.slug,
    required this.image,
    required this.name,
    required this.description,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      slug: json['slug'] ?? '',
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
