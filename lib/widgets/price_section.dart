import 'package:flutter/material.dart';

import '../utils/constants.dart';
class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Masoor Dal 1KG",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          "Unpolished Masoor Dal",
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 12),

        Row(
          children: const [
            Text(
              "₹125.00",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryBrown,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "₹135.00",
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
