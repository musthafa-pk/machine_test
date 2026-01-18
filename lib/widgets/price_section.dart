import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../utils/constants.dart';
class ProductInfoSection extends StatelessWidget {
  final ProductModel product;
  const ProductInfoSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          "${product.name}",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
         Text(
          "${product.name}",
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 12),

        Row(
          children:  [
            Text(
              "₹${product.price}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryBrown,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "₹${product.oldPrice}",
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "(14% off)",
              style: TextStyle(
                color: AppColors.primaryBrown,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
