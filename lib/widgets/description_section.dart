import 'package:flutter/material.dart';
class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Description",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Bag of Green offers premium Strawberries from South Africa, prized for their vibrant red color, natural sweetness, and juicy texture. Perfect for snacking, desserts, and smoothies, these strawberries are carefully sourced and delivered fresh anywhere in the UAE.",
          style: TextStyle(
            color: Colors.grey,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
