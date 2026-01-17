import 'package:get/get.dart';
import '../../models/product_model.dart';
import '../../services/product_service.dart';
import '../Login/auth_controller.dart';

class ProductListController extends GetxController {
  final int categoryId;

  ProductListController(this.categoryId);

  final ProductService _productService = ProductService();
  final AuthController auth = Get.find<AuthController>();

  var isLoading = false.obs;
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);

      final data = await _productService.fetchProductsByCategory(
        id: auth.userId.value,
        token: auth.token.value,
      );
      print('prooooo:$data');
      if (data['success'] == 1) {

        products.value = (data['our_products'] as List? ?? [])
            .map((e) => ProductModel.fromJson(e))
            .toList();
      }
      print('ppppppp:${products}');
    } finally {
      isLoading(false);
    }
  }
}
