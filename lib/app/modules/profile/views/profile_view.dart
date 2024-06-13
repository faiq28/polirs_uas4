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
                colors: [Colors.purple, Colors.deepPurple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '${controller.user?.displayName}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
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
                    leading: Icon(Icons.cake, color: Colors.purple),
                    title: Text('Birthday'),
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.phone, color: Colors.purple),
                    title: Text('818 123 4567'),
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.account_circle, color: Colors.purple),
                    title: Text('Instagram account'),
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.email, color: Colors.purple),
                    title: Text('${controller.user?.email}'),
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.lock, color: Colors.purple),
                    title: Text('Password'),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      // primary: Colors.purple,
                      // onPrimary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text('Edit profile'),
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
