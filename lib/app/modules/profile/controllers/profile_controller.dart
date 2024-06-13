import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
    final FirebaseAuth _auth = FirebaseAuth.instance;
   final Rx<User?> _firebaseUser = Rx<User?>(null);

  User? get user => _firebaseUser.value;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }
}
