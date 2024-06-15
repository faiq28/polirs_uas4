import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polirs_uas4/app/controllers/auth_controller.dart';
import 'package:polirs_uas4/app/modules/login/controllers/login_controller.dart';
import 'package:polirs_uas4/app/routes/app_pages.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});
  final c = Get.put(AuthController());

  @override
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 242, 255),
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: Color.fromARGB(255, 109, 131, 255)),
              onPressed: () => Get.back(),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Color.fromARGB(255, 109, 131, 255),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 109, 131, 255)),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TextField(
                      controller: controller.emailC,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 109, 131, 255)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(8.0),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(() {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 109, 131, 255)),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: TextField(
                        controller: controller.passwordC,
                        obscureText: controller.isObscure.value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 109, 131, 255)),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(8.0),
                          suffixIcon: IconButton(
                              icon: Icon(
                                controller.isObscure.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color.fromARGB(255, 109, 131, 255),
                              ),
                              onPressed: () => controller.obscureFunc()),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }),
                  const SizedBox(height: 12),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Text('p'),
                        TextButton(
                            onPressed: () => Get.toNamed(Routes.REGISTER),
                            child: const Text('Belum Punya Akun? Register',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 109, 131, 255),
                                ))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Obx(() {
                    return c.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Color.fromARGB(255, 109, 131, 255),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(
                                  255, 109, 131, 255), // Warna latar belakang
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 15,
                              ),
                            ),
                            onPressed: () => c.login(
                              controller.emailC.text,
                              controller.passwordC.text,
                            ),
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                  }),
                  SizedBox(
                    height: 32,
                  ),
                  Center(
                      child: Text("Atau Login dengan",
                          style: TextStyle(
                            color: Color.fromRGBO(88, 88, 88, 1),
                          ))),
                  const SizedBox(height: 12),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => c.signInWithGoogle(),
                          child: Image.asset(
                            '/images/google.png',
                            width: 50, // Sesuaikan ukuran ikon
                            height: 50,
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
