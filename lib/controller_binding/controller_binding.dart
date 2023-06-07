import 'package:get/instance_manager.dart';
import 'package:myapp/src/lap_room/getx/controller.dart';
import 'package:myapp/src/materail_product/getx/controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductController>(ProductController());
    Get.put<LabController >(LabController());
  }
}