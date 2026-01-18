import 'package:flutter/material.dart';
import '../models/banner_model.dart';
import '../utils/constants.dart';

class BannerSlider extends StatelessWidget {
  final List<BannerModel> banners;

  const BannerSlider({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    // 🎨 Gradient list (auto cycles using index)
    final List<List<Color>> bannerGradients = [
      [Color(0xFFFF8A3D), Color(0xFFFFB46A)], // Orange
      [Color(0xFF8E2DE2), Color(0xFF4A00E0)], // Purple
      [Color(0xFF11998E), Color(0xFF38EF7D)], // Green
      [Color(0xFFFC5C7D), Color(0xFF6A82FB)], // Pink/Blue
    ];

    return SizedBox(
      height: 190,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.92),
        itemCount: banners.length,
        itemBuilder: (context, index) {
          final banner = banners[index];
          final gradientColors =
          bannerGradients[index % bannerGradients.length];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: gradientColors,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            banner.subTitle.isNotEmpty
                                ? banner.subTitle
                                : "Hurry Up! Get 10% Off",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            banner.title.isNotEmpty
                                ? banner.title
                                : "Go Natural with\nUnpolished Grains",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 14),
                          ElevatedButton(
                            onPressed: () {
                              // TODO: banner click action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              banner.buttonText.isNotEmpty
                                  ? banner.buttonText
                                  : "Shop Now",
                              style: const TextStyle(
                                color: AppColors.primaryBrown,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 110,
                      child: Image.network(
                        "${AppConstants.imageBaseUrl}${banner.image}",
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/qwe.png',
                            fit: BoxFit.contain,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
