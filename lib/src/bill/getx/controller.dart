import 'dart:async';

import 'package:get/state_manager.dart';
import 'package:myapp/src/bill/getx/model.dart';
import 'package:myapp/src/bill/getx/service.dart';


class BillController extends GetxController {
  var isLoading = true.obs;
  var statetList = <BillsModel>[].obs;
  Timer? timer;

  @override
  void onInit() {
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      fetchLab();
     });
    super.onInit();
  }

  void fetchLab() async {
    try {
      isLoading(true);
      var products = await RemoteServiceBills.fetchLab();
      if (products != null) {
        statetList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}