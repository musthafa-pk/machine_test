import 'package:flutter/material.dart';
import '../models/banner_model.dart';
import '../utils/constants.dart';
class BannerSlider extends StatelessWidget {
  final List<BannerModel> banners;

  const BannerSlider({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.92),
        itemCount: banners.length,
        itemBuilder: (context, index) {
          final banner = banners[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              // child: Image.network(
              //   "${AppConstants.imageBaseUrl}${banner.image}",
              //   fit: BoxFit.cover,
              // )
            ),
          );
        },
      ),
    );
  }
}
