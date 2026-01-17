import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../widgets/description_section.dart';
import '../../widgets/image_slider.dart';
import '../../widgets/price_section.dart';
import '../../widgets/related_products.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(color: Colors.black),
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.shopping_bag_outlined, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ImageSlider(),
            Padding(
              padding: EdgeInsets.all(16),
              child: ProductInfoSection(),
            ),
            Divider(height: 1),
            Padding(
              padding: EdgeInsets.all(16),
              child: DescriptionSection(),
            ),
            RelatedProductsSection(),
            SizedBox(height: 80),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 52,
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBrown,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: const Icon(Icons.shopping_cart_outlined),
            label: const Text(
              "Add To Cart",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
