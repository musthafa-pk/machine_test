import 'package:flutter/material.dart';
import 'product_card.dart';

class ProductSection extends StatelessWidget {
  final String title;

  const ProductSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
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
                style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(left: 16),
                child: ProductCard(),
              );
            },
          ),
        ),
      ],
    );
  }
}
