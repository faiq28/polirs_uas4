import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  
  RxBool isObscure = true.obs;

  obscureFunc() {
    isObscure.value = !isObscure.value;
  }
}
