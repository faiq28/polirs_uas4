import 'package:get/get.dart';

import '../controllers/poli_user_controller.dart';

class PoliUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoliUserController>(
      () => PoliUserController(),
    );
  }
}
