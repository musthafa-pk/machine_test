import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/constants.dart';
import '../../widgets/banner_slider.dart';
import '../../widgets/category_list.dart';
import '../../widgets/product_section.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBrown,
        elevation: 0,
        leading: const Icon(Icons.shopping_cart, color: Colors.white),
        actions: const [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.favorite_border, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.notifications_none, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body:Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.hasData.value) {
          return RefreshIndicator(
            color: AppColors.primaryBrown,
            onRefresh: ()async{
              await controller.fetchHome();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  SizedBox(height: 16),
                  // Obx(() {
                  //   if (controller.banner1.isEmpty) {
                  //     return const SizedBox(); // nothing to show
                  //   }
                  //
                  //   return BannerSlider(
                  //     banners: controller.banner1.toList(),
                  //   );
                  // }),

                  SizedBox(height: 24),

                  Obx(() {
                    if (controller.categories.isEmpty) {
                      return const SizedBox();
                    }

                    return CategoryList(
                      categories: controller.categories.toList(),
                    );
                  }),

                  ProductSection(title: "Featured Products"),
                  ProductSection(title: "Daily Best Selling"),
                  // if (controller.banner1.isNotEmpty)
                  //   BannerSlider(banners: controller.banner1),
                  ProductSection(title: "Recently Added"),
                  ProductSection(title: "Popular Products"),
                  ProductSection(title: "Trending Products"),
                  SizedBox(height: 16),
                ],
              ),
            ),
          );
        }
        return const Center(child: Text("No data found"));
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppColors.primaryBrown,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
