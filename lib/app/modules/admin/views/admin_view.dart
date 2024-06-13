import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polirs_uas4/app/routes/app_pages.dart';

import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    final circularMenu = CircularMenu(
      items: [
        CircularMenuItem(
          badgeLabel: 'Home',
          icon: Icons.home,
          onTap: () {
            // callback for home
            print('Home tapped');
          },
        ),
        CircularMenuItem(
          badgeLabel: 'Open Scanner',
          icon: Icons.qr_code_scanner_outlined,
          onTap: () {
            controller.openScanner();
          },
        ),
        CircularMenuItem(
          badgeLabel: 'Open PDF',
          icon: Icons.edit_document,
          onTap: () {
            // controller.bookingPdf();
          },
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Polikan Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
              print('Notifications tapped');
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
            _buildDashboardCard(
              icon: Icons.people,
              title: 'Patients',
              subtitle: 'Manage Patients',
              color: Colors.blue,
              onTap: () {
                print('Patients tapped');
                // Navigate to Patients Management
              },
            ),
            _buildDashboardCard(
              icon: Icons.calendar_today,
              title: 'Appointments',
              subtitle: 'View Appointments',
              color: Colors.green,
              onTap: () {
                print('Appointments tapped');
                // Navigate to Appointments
              },
            ),
            _buildDashboardCard(
              icon: Icons.show_chart,
              title: 'Statistics',
              subtitle: 'View Statistics',
              color: Colors.orange,
              onTap: () {
                print('Statistics tapped');
                // Navigate to Statistics
              },
            ),
            _buildDashboardCard(
              icon: Icons.add_chart_outlined,
              title: 'Tambah Data',
              subtitle: 'Buat Jadwal Poli',
              color: Colors.red,
              onTap: () {
                print('Tambah Data tapped');
                Get.toNamed(Routes.TAMBAH_POLI);
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: circularMenu,
    );
  }

  Widget _buildDashboardCard({
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
