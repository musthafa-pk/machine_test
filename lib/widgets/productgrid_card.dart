import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:macine_test/modules/Products/product_detail_page.dart';
import '../models/product_model.dart';
import '../utils/constants.dart';

class ProductGridCard extends StatelessWidget {
  final ProductModel product;

  const ProductGridCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailPage(
          products: product,
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Image.network(
                      "${AppConstants.imageBaseUrl}${product.image}",
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) =>
                          Image.asset('assets/images/product.jpg'),
                    ),
                  ),
                ),
                
                if (product.oldPrice != null &&
                    product.oldPrice!.isNotEmpty &&
                    product.oldPrice != product.price)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBrown,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        "20% off",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
      
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(
                    Icons.favorite_border,
                    color: AppColors.primaryBrown,
                  ),
                ),
              ],
            ),
      
            const SizedBox(height: 10),
      
            SizedBox(
              width: double.infinity,
              child: Text(
                product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
      
      
            const SizedBox(height: 6),
      
            Row(
              children: [
                Text(
                  "₹ ${product.price}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBrown,
                  ),
                ),
                const SizedBox(width: 8),
                if (product.oldPrice != null &&
                    product.oldPrice!.isNotEmpty &&
                    product.oldPrice != product.price)
                  Text(
                    "₹ ${product.oldPrice}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w500,
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
                    color: Colors.black.withOpacity(0.12),
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(double.infinity, 40),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add",
                      style: TextStyle(
                        color: AppColors.primaryBrown,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
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
