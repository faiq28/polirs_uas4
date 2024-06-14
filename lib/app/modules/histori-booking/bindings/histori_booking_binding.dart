import 'package:get/get.dart';

import '../controllers/histori_booking_controller.dart';

class HistoriBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoriBookingController>(
      () => HistoriBookingController(),
    );
  }
}
