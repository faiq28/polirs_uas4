import 'package:get/get.dart';

import '../controllers/selesai_admin_controller.dart';

class SelesaiAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelesaiAdminController>(
      () => SelesaiAdminController(),
    );
  }
}
