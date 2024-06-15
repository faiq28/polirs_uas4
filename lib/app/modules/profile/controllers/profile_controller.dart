import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<User?> user = Rx<User?>(null);


  @override
 void onInit() {
    super.onInit();
    user.value = FirebaseAuth.instance.currentUser;
  }
}
