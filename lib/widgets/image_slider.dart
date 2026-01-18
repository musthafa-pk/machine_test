import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ImageSlider extends StatefulWidget {
  final List<String> images; // asset image paths

  const ImageSlider({
    super.key,
    required this.images,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// IMAGE SLIDER
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
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
                child: PageView.builder(
                  itemCount: widget.images.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Center(
                      child: Image.asset(
                        widget.images[index],
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
              ),

              /// HEART ICON
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {
                    // wishlist action
                  },
                  icon: Image.asset(
                    'assets/icons/heart.png',
                    scale: 2,
                    color: AppColors.primaryBrown,
                  ),
                ),
              ),
            ],
          ),
        ),

        /// INDICATOR
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.images.length,
                (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentIndex == index ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: currentIndex == index
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
