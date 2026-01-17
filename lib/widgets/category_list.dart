import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/categorywrapper_model.dart';
import '../modules/Products/ProductList_page.dart';
import '../utils/constants.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryWrapperModel> categories;

  const CategoryList({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Categories",
                style: TextStyle(color: AppColors.primaryBrown,fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index].category;

              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => ProductListPage(
                      categoryId: category.id,
                      categoryName: category.name,
                    ));
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey.shade200,
                        child: category.image.isNotEmpty
                            ? ClipOval(
                          child: Image.network(
                            "${AppConstants.imageBaseUrl}${category.image}",
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                            Image.asset('assets/images/category.png'),
                          ),
                        )
                            : Image.asset('assets/images/category.png'),
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: 70,
                        child: Text(
                          category.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
