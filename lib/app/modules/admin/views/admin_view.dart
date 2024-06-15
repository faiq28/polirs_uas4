import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_qrcode_scanner/flutter_web_qrcode_scanner.dart';
import 'package:get/get.dart';
import 'package:polirs_uas4/app/controllers/auth_controller.dart';
import 'package:polirs_uas4/app/routes/app_pages.dart';

import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  CameraController _controller = CameraController(autoPlay: false);
  AdminView({super.key});

  final c = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    // final circularMenu = CircularMenu(
    //   items: [
    //     CircularMenuItem(
    //       badgeLabel: 'Home',
    //       icon: Icons.home,
    //       onTap: () {
    //         // callback for home
    //         print('Home tapped');
    //       },
    //     ),
    //     CircularMenuItem(
    //       badgeLabel: 'Open Scanner',
    //       icon: Icons.qr_code_scanner_outlined,
    //       onTap: () {
    //         controller.openScanner();
    //       },
    //     ),
    //     CircularMenuItem(
    //       badgeLabel: 'Open PDF',
    //       icon: Icons.edit_document,
    //       onTap: () {
    //         // controller.bookingPdf();
    //       },
    //     ),
    //   ],
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text('POLI RS BPJS KECAMATAN'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Handle notifications
              c.logOut();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            // _Card(
            //   icon: Icons.people,
            //   title: 'Pasien',
            //   subtitle: 'Data Pasien',
            //   color: Colors.blue,
            //   onTap: () {
            //     print('Pasien dipencet');
            //     // Navigate to Pasien Management
            //   },
            // ),
            _Card(
              icon: Icons.calendar_today,
              title: 'Jadwal ',
              subtitle: 'Lihat Jadwal Dokter',
              color: Color.fromARGB(255, 109, 131, 255),
              onTap: () {
                print('Appointments tapped');
                Get.toNamed(Routes.POLI_ADMIN);
                // Navigate to Appointments
              },
            ),
            // _Card(
            //   icon: Icons.show_chart,
            //   title: 'Statistics',
            //   subtitle: 'View Statistics',
            //   color: Colors.orange,
            //   onTap: () {
            //     print('Statistics tapped');
            //     // Navigate to Statistics
            //   },
            // ),
            _Card(
              icon: Icons.add_chart_outlined,
              title: 'Tambah Data',
              subtitle: 'Buat Jadwal Poli',
              color: Color.fromARGB(255, 109, 131, 255),
              onTap: () {
                print('Tambah Data tapped');
                Get.toNamed(Routes.TAMBAH_POLI);
              },
            ),
            //   Container(
            //     child: Column(
            //       children: [
            //   FlutterWebQrcodeScanner(
            //     cameraDirection: CameraDirection.back,
            //     stopOnFirstResult: false,
            //     controller: _controller,
            //     onGetResult: (result) {
            //       _controller.stopVideoStream();
            //            print(result);
            //           //  Get.toNamed(Routes.RUANG_LELANG, arguments: {"id_lelang": result});
            //     },
            //     width: 500,
            //     height: 500,
            //   ),
            //   ElevatedButton(
            //     onPressed: () {
            //       // Ensure to start or resume the camera stream
            //       _controller.startVideoStream();
            //     },
            //     child: Text('Start Scanning'),
            //   ),
            // ],
            //     ),
            //   ),
            _Card(
              icon: Icons.qr_code_scanner_outlined,
              title: 'QR',
              subtitle: 'Scan Tiket Poli',
              color: Color.fromARGB(255, 109, 131, 255),
              onTap: () {
                print('SCAN QR TAPPED');
                // controller.openScanner();
                Get.toNamed(Routes.SCAN);
              },
            ),
            _Card(
              icon: Icons.content_paste,
              title: 'Daftar Selesai',
              subtitle: 'LIhat pasien yang Sudah ditangani',
              color: Color.fromARGB(255, 109, 131, 255),
              onTap: () {
                print('Tambah Data tapped');
                Get.toNamed(Routes.SELESAI_ADMIN);
              },
            ),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: circularMenu,
    );
  }

  Widget _Card({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required Function() onTap,
  }) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
