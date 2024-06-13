// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polirs_uas4/app/controllers/auth_controller.dart';
import 'package:polirs_uas4/app/modules/login/views/login_view.dart';
import 'package:polirs_uas4/app/modules/register/controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final c = Get.put(AuthController());
  final RxBool isAdmin = false.obs; // Menggunakan RxBool untuk isAdmin

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Icon(Icons.bloodtype, size: 50, color: Colors.white),
                const SizedBox(height: 20),
                const Text(
                  'REGISTER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: controller.userNameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8.0),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8.0),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(() {
                    return TextField(
                      controller: controller.passwordController,
                      obscureText: controller.isObscure.value,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(8.0),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isObscure.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                          onPressed: () => controller.obscureFunc(),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    );
                  }),
                ),
                const SizedBox(height: 10),
                Obx(() => Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Admin Access',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Switch(
                          value: isAdmin.value,
                          onChanged: (value) {
                            isAdmin.value = value;
                          },
                        ),
                      ],
                    )),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Obx(() => ElevatedButton(
                        style: const ButtonStyle(
                          padding:
                              MaterialStatePropertyAll(EdgeInsets.symmetric(
                            vertical: 9,
                            horizontal: 18,
                          )),
                        ),
                        onPressed: () async {
                          c.isLoading.isTrue
                              ? null
                              : await c.register(
                                  isAdmin: isAdmin.value,
                                  email: controller.emailController.text,
                                  password: controller.passwordController.text,
                                  userName: controller.userNameController.text,
                                );
                        },
                        child: c.isLoading.isTrue
                            ? const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white),
                              )
                            : Text(
                                'Sign Up',
                              ),
                      )),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => LoginView());
                  },
                  child: Text(
                    "sudah punya akun?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }
}
