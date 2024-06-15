// ignore_for_file: duplicate_import

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:polirs_uas4/app/modules/poli-user/controllers/poli_user_controller.dart';

import '../controllers/poli_admin_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polirs_uas4/app/data/model/jadwalpolimodel.dart';
import 'package:polirs_uas4/app/modules/poli-user/controllers/poli_user_controller.dart';
import 'package:polirs_uas4/app/routes/app_pages.dart';
import 'package:intl/intl.dart'; // Add this import for DateFormat

class PoliAdminView extends GetView<PoliAdminController> {
  PoliAdminView({super.key});

  final c = Get.put(PoliUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Poliklinik Hari Ini'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: c.streamJadwalPoli(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Tidak Ada Jadwal Poli'));
          }

          List<JadwalPoli> allPoli = [];

          for (var e in snapshot.data!.docs) {
            var data = e.data();
            if (data != null) {
              allPoli.add(JadwalPoli.fromJson(data, e.id));
            }
          }

          return ListView.builder(
            itemCount: allPoli.length,
            itemBuilder: (context, index) {
              JadwalPoli poli = allPoli[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama Dokter: ${poli.namaDokter}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Spesialis: ${poli.spesialis}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Jam Praktek: ${_formatTimestamp(poli.jamPraktek)}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Lokasi: ${poli.lokasi}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Kontak: ${poli.kontak}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        // Text(
                        //   'Informasi Tambahan: ${poli.informasiTambahan}',
                        //   style: const TextStyle(fontSize: 14),
                        // ),
                        // const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Get.defaultDialog(
                                  title: 'Delete Jadwal',
                                  middleText: 'Apakah Kamu Yakin Delete Jadwal',
                                  actions: [
                                    OutlinedButton(
                                      onPressed: () => Get.back(),
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                            color: Colors
                                                .green), // Mengatur warna border
                                      ),
                                      child: const Text(
                                        'No',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        c.deletePoli(poli.codePoli);
                                        Get.back();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .red, // Mengatur warna background
                                      ),
                                      child: Obx(
                                        () => c.status.isFalse
                                            ? const Text(
                                                'Delete',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            : Container(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                width: 15,
                                                height: 15,
                                                child:
                                                    const CircularProgressIndicator(
                                                  strokeWidth: 1,
                                                ),
                                              ),
                                      ),
                                    )
                                  ],
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: const Text(
                                'Delete',
                                style: TextStyle(color: Colors.white),
                            ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                _showUpdateDialog(poli);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.blue, // Warna tombol update
                              ),
                              child: const Text(
                                'Update',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _formatTimestamp(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}';
  }

  void _showUpdateDialog(JadwalPoli poli) {
    TextEditingController namaDokterController =
        TextEditingController(text: poli.namaDokter);
    TextEditingController spesialisController =
        TextEditingController(text: poli.spesialis);
    TextEditingController jamPraktekController =
        TextEditingController(text: _formatTimestamp(poli.jamPraktek));
    TextEditingController lokasiController =
        TextEditingController(text: poli.lokasi);
    TextEditingController kontakController =
        TextEditingController(text: poli.kontak);
    // TextEditingController informasiTambahanController = TextEditingController(text: poli.informasiTambahan ?? "");

    Get.defaultDialog(
      title: 'Update Jadwal Poli',
      content: Column(
        children: [
          TextField(
            controller: namaDokterController,
            decoration: InputDecoration(labelText: 'Nama Dokter'),
          ),
          TextField(
            controller: spesialisController,
            decoration: InputDecoration(labelText: 'Spesialis'),
          ),
          TextField(
            controller: jamPraktekController,
            decoration:
                InputDecoration(labelText: 'Jam Praktek (DD/MM/YYYY HH:MM)'),
          ),
          TextField(
            controller: lokasiController,
            decoration: InputDecoration(labelText: 'Lokasi'),
          ),
          TextField(
            controller: kontakController,
            decoration: InputDecoration(labelText: 'Kontak'),
          ),
          // TextField(
          //   controller: informasiTambahanController,
          //   decoration: InputDecoration(labelText: 'Informasi Tambahan'),
          // ),
        ],
      ),
      actions: [
        OutlinedButton(
          onPressed: () => Get.back(),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.green),
          ),
          child: const Text('Cancel', style: TextStyle(color: Colors.green)),
        ),
        ElevatedButton(
          onPressed: () {
            Timestamp updatedJamPraktek = Timestamp.fromDate(
                DateFormat('dd/MM/yyyy HH:mm')
                    .parse(jamPraktekController.text));
            JadwalPoli updatedPoli = JadwalPoli(
              codePoli: poli.codePoli,
              namaDokter: namaDokterController.text,
              spesialis: spesialisController.text,
              jamPraktek: updatedJamPraktek,
              lokasi: lokasiController.text,
              kontak: kontakController.text,
              // informasiTambahan: informasiTambahanController.text,
            );
            c.updatePoli(updatedPoli);
            Get.back();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text('Update', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
