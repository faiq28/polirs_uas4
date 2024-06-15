import 'package:flutter/material.dart';
import 'package:flutter_web_qrcode_scanner/flutter_web_qrcode_scanner.dart';

import 'package:get/get.dart';
import 'package:polirs_uas4/app/routes/app_pages.dart';

import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  CameraController _controller = CameraController(autoPlay: false);
  ScanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterWebQrcodeScanner(
              cameraDirection: CameraDirection.back,
              stopOnFirstResult: false,
              controller: _controller,
              onGetResult: (result) {
                _controller.stopVideoStream();
                print(result);
                controller.handleQRCodeResult(result);
                Get.offAllNamed(Routes.ADMIN);
              },
              width: 600,
              height: 600,
            ),
            ElevatedButton(
              onPressed: () {
                // Ensure to start or resume the camera stream
                _controller.startVideoStream();
              },
              child: Text('Start Scanning'),
            ),
          ],
        ),
      ),
    );
  }
}
