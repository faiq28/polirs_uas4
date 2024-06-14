import 'package:get/get.dart';

import '../controllers/bookingan_controller.dart';

class BookinganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookinganController>(
      () => BookinganController(),
    );
  }
}
