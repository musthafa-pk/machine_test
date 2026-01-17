import 'package:macine_test/models/sub_category_model.dart';

import 'category_model.dart';

class CategoryWrapperModel {
  final CategoryModel category;
  final List<SubCategoryModel> subCategories;

  CategoryWrapperModel({
    required this.category,
    required this.subCategories,
  });

  factory CategoryWrapperModel.fromJson(Map<String, dynamic> json) {
    return CategoryWrapperModel(
      category: CategoryModel.fromJson(json['category']),
      subCategories: (json['subcategory'] as List? ?? [])
          .map((e) => SubCategoryModel.fromJson(e))
          .toList(),
    );
  }
}
