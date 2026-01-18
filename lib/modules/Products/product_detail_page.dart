import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../../utils/constants.dart';
import '../../widgets/description_section.dart';
import '../../widgets/image_slider.dart';
import '../../widgets/price_section.dart';
import '../../widgets/related_products.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel products;
  const ProductDetailPage({super.key ,required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(color: Colors.black),
        actions: [
          Image.asset('assets/icons/search.png',scale: 2,color: AppColors.primaryText,),
          SizedBox(width: 16),
          Image.asset('assets/icons/solar_cart.png',scale: 2,color: AppColors.primaryText,),
          SizedBox(width: 16),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            ImageSlider(
              images: const [
                'assets/images/product.jpg',
                'assets/images/qwe.png',
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: ProductInfoSection(product: products,),
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
            icon: Image.asset('assets/icons/cart_icon.png',color: Colors.white,height: 28,),
            label: const Text(
              "Add To Cart",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
