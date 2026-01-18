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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBrown,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo.png',),
        ),
        actions:  [
          Image.asset('assets/icons/search.png',scale: 2,),
          SizedBox(width: 16),
          Image.asset('assets/icons/heart.png',scale: 2,),
          SizedBox(width: 16),
          Image.asset('assets/icons/notification1.png',scale: 2,),
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
                  Obx(() {
                    if (controller.banner1.isEmpty) {
                      return const SizedBox(); // nothing to show
                    }

                    return BannerSlider(
                      banners: controller.banner1.toList(),
                    );
                  }),

                  SizedBox(height: 24),

                  Obx(() {
                    if (controller.categories.isEmpty) {
                      return const SizedBox();
                    }
                    return CategoryList(
                      categories: controller.categories.toList(),
                    );
                  }),

                  ProductSection(
                      title: "Featured Products",
                    products: controller.recentProducts,
                  ),
                  ProductSection(
                      title: "Daily Best Selling",
                    products: controller.ourProducts,
                  ),
                  SizedBox(height: 10,),
                  Obx(() {
                    if (controller.banner2.isEmpty) {
                      return const SizedBox(); // nothing to show
                    }

                    return BannerSlider(
                      banners: controller.banner2.toList(),
                    );
                  }),
                  ProductSection(
                      title: "Recently Added",
                    products: controller.recentProducts,
                  ),
                  ProductSection(title: "Popular Products",products: controller.ourProducts,),
                  ProductSection(title: "Trending Products",products: controller.ourProducts,),
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
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/home.png',scale: 2,), label: "Home"),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/tabler_category.png',scale: 2,), label: "Categories"),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/solar_cart.png',scale: 2,), label: "Cart"),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/solar_user.png',scale: 2,), label: "Profile"),
        ],
      ),
    );
  }
}
