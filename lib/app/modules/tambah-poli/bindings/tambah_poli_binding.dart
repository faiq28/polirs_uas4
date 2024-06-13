import 'package:get/get.dart';

import '../controllers/tambah_poli_controller.dart';

class TambahPoliBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahPoliController>(
      () => TambahPoliController(),
    );
  }
}
