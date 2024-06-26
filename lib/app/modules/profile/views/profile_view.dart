// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polirs_uas4/app/controllers/auth_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});

  final authController = Get.put(AuthController());
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: lebar,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 109, 131, 255),
                  Color.fromARGB(255, 186, 217, 255)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Color.fromARGB(255, 109, 131, 255),
                  ),
                ),
                SizedBox(width: 16),
                Obx(() {
                  final user = profileController.user.value;
                  return Text(
                    user?.displayName ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  );
                }),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.phone,
                        color: Color.fromARGB(255, 109, 131, 255)),
                    title: Obx(() {
                      final user = profileController.user.value;
                      return Text(
                          user?.phoneNumber ?? 'Anda belum mengisi nomor');
                    }),
                  ),
                ),
                Divider(
                  color: Color.fromARGB(255, 109, 131, 255),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.email,
                        color: Color.fromARGB(255, 109, 131, 255)),
                    title: Obx(() {
                      final user = profileController.user.value;
                      return Text(user?.email ?? 'Email');
                    }),
                  ),
                ),
                Divider(
                  color: Color.fromARGB(255, 109, 131, 255),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.lock,
                        color: Color.fromARGB(255, 109, 131, 255)),
                    title: Text(
                        'Password anda bersifat privasi, Harap reset password jika anda lupa',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                        )),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () => authController.logOut(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      textStyle: const TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Log Out',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
