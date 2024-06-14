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

class PoliAdminView extends GetView<PoliAdminController> {
  PoliAdminView({super.key});

  final c = Get.put(PoliUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilihan Jadwal Poliklinik'),
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
                child: Dismissible(
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
                            c.deletePoli(poli.codePoli);
                            Get.back();
                          },
                          child: Obx(
                            () => c.status.isFalse
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
                          Container(
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
