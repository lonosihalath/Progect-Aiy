import 'package:get/state_manager.dart';
import 'package:myapp/src/materail_product/getx/model.dart';
import 'package:myapp/src/materail_product/getx/service.dart';


class ProductController extends GetxController {
  var isLoading = true.obs;
  var statetList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServiceProduct.fetchProducts();
      if (products != null) {
        statetList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}