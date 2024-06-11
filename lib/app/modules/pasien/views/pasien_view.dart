import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pasien_controller.dart';

class PasienView extends GetView<PasienController> {
  const PasienView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PasienView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PasienView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
