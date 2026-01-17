import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../utils/constants.dart';

class ProductGridCard extends StatelessWidget {
  final ProductModel product;

  const ProductGridCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              "${AppConstants.imageBaseUrl}${product.image}",
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) =>
              Image.asset('assets/images/product.jpg'),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Text(
            "₹${product.price}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
