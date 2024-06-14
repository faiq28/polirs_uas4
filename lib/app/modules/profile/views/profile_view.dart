// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

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
                Text(
                  '${controller.user?.displayName}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
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
                    title: Text('0812 3456 7890'),
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
                    title: Text('${controller.user?.email}'),
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
                    title: Text('Password'),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 109, 131, 255),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white, // Menambahkan warna teks putih
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Edit profile',
                      style: TextStyle(
                          color: Colors.white), // Menambahkan warna teks putih
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
