import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polirs_uas4/app/data/model/jadwalpolimodel.dart';
import 'package:polirs_uas4/app/routes/app_pages.dart';

import '../controllers/poli_user_controller.dart';

class PoliUserView extends GetView<PoliUserController> {
  const PoliUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Poli Hari Ini'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: controller.streamJadwalPoli(),
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
                child: Column(
                  children: [
                    const SizedBox(height: 20), // Adjust the height as needed
                    Dismissible(
                      key: Key(poli.codePoli.toString()),
                      confirmDismiss: (direction) {
                        return Get.defaultDialog(
                          title: 'Delete Jadwal',
                          middleText: 'Apakah Kamu Yakin Delete Jadwal',
                          actions: [
                            OutlinedButton(
                              onPressed: () => Get.back(),
                              child: const Text('No'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.deletePoli(poli.codePoli);
                                Get.back();
                              },
                              child: Obx(
                                () => controller.status.isFalse
                                    ? const Text('Delete')
                                    : Container(
                                        padding: const EdgeInsets.all(2),
                                        width: 15,
                                        height: 15,
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 1,
                                        ),
                                      ),
                              ),
                            )
                          ],
                        );
                      },
                      child: InkWell(
                        onTap: () => Get.toNamed(
                          Routes.DETAIL_POLI_USER,
                          arguments: poli,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
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
                                    Text(
                                      'Informasi Tambahan: ${poli.informasiTambahan}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
}
