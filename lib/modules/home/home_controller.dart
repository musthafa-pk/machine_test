import 'package:get/get.dart';
import '../../models/categorywrapper_model.dart';
import '../../services/home_service.dart';
import '../../models/banner_model.dart';
import '../../models/product_model.dart';
import '../Login/auth_controller.dart';

class HomeController extends GetxController {
  final HomeService _homeService = HomeService();
  final AuthController auth = Get.find<AuthController>();

  var isLoading = false.obs;
  var hasData = true.obs; // 👈 NEW

  var banner1 = <BannerModel>[].obs;
  var banner2 = <BannerModel>[].obs;
  var recentProducts = <ProductModel>[].obs;
  var ourProducts = <ProductModel>[].obs;
  var categories = <CategoryWrapperModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHome();
  }

  Future<void> fetchHome() async {
    try {
      isLoading(true);
      hasData(true);

      final data = await _homeService.fetchHomeData(
        id: auth.userId.value,
        token: auth.token.value,
      );

      if (data['success'] == 1) {
        print('helooo${data}');
        banner1.value = (data['banner1'] as List? ?? [])
            .map((e) => BannerModel.fromJson(e))
            .toList();

        banner2.value = (data['banner2'] as List? ?? [])
            .map((e) => BannerModel.fromJson(e))
            .toList();

        recentProducts.value = (data['recentviews'] as List? ?? [])
            .map((e) => ProductModel.fromJson(e))
            .toList();

        ourProducts.value = (data['our_products'] as List? ?? [])
            .map((e) => ProductModel.fromJson(e))
            .toList();

        categories.value = (data['categories'] as List? ?? [])
            .map((e) => CategoryWrapperModel.fromJson(e))
            .toList();

        if (banner1.isEmpty &&
            banner2.isEmpty &&
            recentProducts.isEmpty &&
            ourProducts.isEmpty &&
        categories.isEmpty) {
          hasData(false);
        }
      } else {
        _clearAll();
        hasData(false);
      }
    } catch (e) {
      _clearAll();
      hasData(false);
    } finally {
      isLoading(false);
    }
  }

  void _clearAll() {
    banner1.clear();
    banner2.clear();
    recentProducts.clear();
    ourProducts.clear();
  }
}
