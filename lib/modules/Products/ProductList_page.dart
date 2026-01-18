import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macine_test/modules/Products/product_list_controller.dart';
import 'package:macine_test/utils/constants.dart';
import '../../widgets/productgrid_card.dart';
import '../../widgets/sort_filter_bar.dart';

class ProductListPage extends StatelessWidget {
  final int categoryId;
  final String categoryName;

  const ProductListPage({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final ProductListController controller = Get.put(ProductListController(categoryId));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,

              ),
            ),
            Obx(() => Text(
              "${controller.products.length} Items",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            )),
          ],
        ),
        actions: [
          Image.asset('assets/icons/search.png',scale: 2,color: AppColors.primaryText,),
          SizedBox(width: 16),
          Image.asset('assets/icons/solar_cart.png',scale: 2,color: AppColors.primaryText,),
          SizedBox(width: 16),
        ],
      ),

      body: Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.products.isEmpty) {
        return RefreshIndicator(
          onRefresh: controller.fetchProducts,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: const [
              SizedBox(height: 200),
              Center(child: Text("No products found")),
            ],
          ),
        );
      }

      return RefreshIndicator(
        color: Colors.brown,
        onRefresh: controller.fetchProducts,
        child: GridView.builder(
          padding: const EdgeInsets.all(12),
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: controller.products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            return ProductGridCard(
              product: controller.products[index],
            );
          },
        ),
      );
    }),


    bottomNavigationBar: const SortFilterBar(),
    );
  }
}
