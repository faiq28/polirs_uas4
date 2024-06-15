import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polirs_uas4/app/controllers/auth_controller.dart';
import 'package:polirs_uas4/app/routes/app_pages.dart';

import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  AdminView({super.key});

  final c = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('POLI RS BPJS KECAMATAN')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _Card(
              icon: Icons.calendar_today,
              title: 'Jadwal',
              subtitle: 'Lihat Jadwal Dokter',
              color: Color.fromARGB(255, 109, 131, 255),
              onTap: () {
                print('Appointments tapped');
                Get.toNamed(Routes.POLI_ADMIN);
              },
            ),
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
            _Card(
              icon: Icons.qr_code_scanner_outlined,
              title: 'QR',
              subtitle: 'Scan Tiket Poli',
              color: Color.fromARGB(255, 109, 131, 255),
              onTap: () {
                print('SCAN QR TAPPED');
                Get.toNamed(Routes.SCAN);
              },
            ),
            _Card(
              icon: Icons.content_paste,
              title: 'Daftar Selesai',
              subtitle: 'Lihat pasien yang sudah selesai',
              color: Color.fromARGB(255, 109, 131, 255),
              onTap: () {
                print('Tambah Data tapped');
                Get.toNamed(Routes.SELESAI_ADMIN);
              },
            ),
            _Card(
              icon: Icons.logout,
              title: 'Logout',
              subtitle: 'Keluar Dari Halaman Admin',
              color: Colors.red,
              onTap: () {
                print('Tambah Data tapped');
                c.logOut();
              },
            ),
          ],
        ),
      ),
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
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 40,
                color: color,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
