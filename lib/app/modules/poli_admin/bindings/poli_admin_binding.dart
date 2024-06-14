import 'package:get/get.dart';

import '../controllers/poli_admin_controller.dart';

class PoliAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoliAdminController>(
      () => PoliAdminController(),
    );
  }
}
