import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:macine_test/modules/Products/product_detail_page.dart';
import 'package:macine_test/utils/constants.dart';
import '../models/product_model.dart';
import 'product_card.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final List<ProductModel> products;

  const ProductSection({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBrown,
                ),
              ),
              Row(
                children: const [
                  Icon(Icons.chevron_left),
                  Icon(Icons.chevron_right),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 255,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: GestureDetector(
                  onTap: (){
                    Get.to(() => ProductDetailPage(
                      products: products[index],
                    ));
                  },
                  child: ProductCard(
                    product: products[index],
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
