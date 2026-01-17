import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
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
          Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.favorite_border,
                size: 18, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Container(
            height: 80,
            color: Colors.grey.shade200,
            child: const Center(child: Icon(Icons.image)),
          ),
          const SizedBox(height: 8),
          const Text(
            "Flours & Sugars",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          const Text(
            "Light pink salt 1 kg",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          const Text("₹ 62.00   ₹ 80.00",
              style: TextStyle(fontSize: 12)),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primaryBrown,
              ),
              child: const Text("Add"),
            ),
          ),
        ],
      ),
    );
  }
}
