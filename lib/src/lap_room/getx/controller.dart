import 'package:get/state_manager.dart';
import 'package:myapp/src/lap_room/getx/model.dart';
import 'package:myapp/src/lap_room/getx/service.dart';


class LabController extends GetxController {
  var isLoading = true.obs;
  var statetList = <Lab>[].obs;

  @override
  void onInit() {
    fetchLab();
    super.onInit();
  }

  void fetchLab() async {
    try {
      isLoading(true);
      var products = await RemoteServiceLab.fetchLab();
      if (products != null) {
        statetList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}