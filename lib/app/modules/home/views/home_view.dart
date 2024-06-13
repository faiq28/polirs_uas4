import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polirs_uas4/app/routes/app_pages.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../detail-poli-user/model/booking_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: size.width,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7B61FF), Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 50),
                      const Text(
                        'Halo,',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'irana',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Semoga Anda lekas sembuh',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 1),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'images/doctorhome.png',
                    height: 100,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
              child: GridView.count(
                crossAxisCount: 3,
                children: <Widget>[
                  InkWell(
                    onTap: () => Get.toNamed(Routes.ARTIKEL),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.receipt_long,
                          size: 50,
                          color: Colors.purple,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Tentang Penyakit',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.POLI_USER),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.local_hospital,
                          size: 50,
                          color: Colors.purple,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Poli',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.PROFILE),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.purple,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              height: size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: controller.streamBooking(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                        child: Text('Anda Tidak Memiliki Jadwal Booking'));
                  }

                  List<Booking> allBooking = [];

                  for (var e in snapshot.data!.docs) {
                    var data = e.data();
                    if (data != null) {
                      allBooking.add(Booking.fromJson(data));
                    }
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: allBooking.length,
                    itemBuilder: (context, index) {
                      Booking data = allBooking[index];
                      return InkWell(
                        onTap: () => _showDetailDialog(context, data),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dokter: ${data.namaDokter}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Spesialis: ${data.spesialis}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Jam Praktek: ${_formatTimestamp(data.jam)}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Nama Pasien: ${data.nama}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Kontak Pasien: ${data.notelepon}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Alamat Pasien: ${data.alamat}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 85,
                                    width: 85,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      // borderRadius:
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.timer),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    _formatTimestamp(data.tanggalBooking),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatTimestamp(Timestamp timestamp) {
  DateTime date = timestamp.toDate();
  return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}';
}

void _showDetailDialog(BuildContext context, Booking data) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          _formatTimestamp(data.tanggalBooking),
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SizedBox(
                  height: 160,
                  width: 160,
                  child: QrImageView(
                    data: data.codePoli.toString(),
                    version: QrVersions.auto,
                    size: 200,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Jangan Sebarluaskan Barcode Ini',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}
