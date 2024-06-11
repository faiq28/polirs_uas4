import 'package:get/get.dart';

import '../controllers/pasien_controller.dart';

class PasienBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasienController>(
      () => PasienController(),
    );
  }
}
