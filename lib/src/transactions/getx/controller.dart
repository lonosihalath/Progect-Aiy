import 'dart:async';

import 'package:get/state_manager.dart';
import 'package:myapp/src/transactions/getx/model.dart';
import 'package:myapp/src/transactions/getx/service.dart';


class TransactionsController extends GetxController {
  var isLoading = true.obs;
  var statetList = <Transactions>[].obs;
  Timer ?timer;

  @override
  void onInit() {
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      fetchTransactions();
     });
    super.onInit();
  }

  void fetchTransactions() async {
    try {
      isLoading(true);
      var products = await RemoteServiceTransactions.fetchTransactions();
      if (products != null) {
        statetList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}