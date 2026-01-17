class SubCategoryModel {
  final int id;
  final String name;
  final String slug;
  final String image;

  SubCategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
