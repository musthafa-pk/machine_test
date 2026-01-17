import 'package:flutter/material.dart';

import '../utils/constants.dart';


class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
              ),
            ],
          ),
          child: Stack(
            children: [
              SizedBox(
                height: 220,
                child: Center(
                  child: Icon(Icons.image, size: 140),
                ),
              ),
              const Positioned(
                top: 0,
                right: 0,
                child: Icon(
                  Icons.favorite_border,
                  color: AppColors.primaryBrown,
                ),
              ),
            ],
          ),
        ),

        // Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4,
                (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: index == 0 ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: index == 0
                    ? AppColors.primaryBrown
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
