import 'package:get/get.dart';

import '../controllers/detail_poli_user_controller.dart';

class DetailPoliUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPoliUserController>(
      () => DetailPoliUserController(),
    );
  }
}
