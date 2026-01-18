import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../models/product_model.dart';
import '../modules/Products/product_detail_page.dart';
import '../utils/constants.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailPage(
          products: product,
        ));
      },
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Image.network(
                      "${AppConstants.imageBaseUrl}${product.image}",
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) =>
                          Image.asset('assets/images/qwe.png'),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Image.asset(
                    'assets/icons/heart.png',
                    color: AppColors.primaryBrown,
                    scale: 2,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),


            const SizedBox(height: 4),

            SizedBox(
              width: double.infinity,
              child: Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
              ),
            ),

            const SizedBox(height: 6),

            Row(
              children: [
                Text(
                  "₹ ${product.price}",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBrown,
                  ),
                ),
                const SizedBox(width: 8),
                if (product.oldPrice != null &&
                    product.oldPrice != product.price)
                  Text(
                    "₹ ${product.oldPrice}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.primaryText,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
              ],
            ),

            const Spacer(),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add',
                      style: TextStyle(
                        color: AppColors.primaryBrown,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Image.asset(
                      'assets/icons/cart_icon.png',
                      scale: 2,
                      color: AppColors.primaryBrown,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
