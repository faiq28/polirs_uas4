import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polirs_uas4/app/data/model/jadwalpolimodel.dart';

import '../controllers/detail_poli_user_controller.dart';

class DetailPoliUserView extends GetView<DetailPoliUserController> {
  const DetailPoliUserView({super.key});

  @override
  Widget build(BuildContext context) {
    var poli = Get.arguments as JadwalPoli;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Dokter: ${poli.namaDokter}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Spesialis: ${poli.spesialis}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Jam Praktek: ${_formatTimestamp(poli.jamPraktek)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Lokasi: ${poli.lokasi}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Kontak: ${poli.kontak}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Informasi Tambahan: ${poli.informasiTambahan}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 32),
                  TextButton(
                      onPressed: () {
                        controller.isOpen.value = !controller.isOpen.value;
                      },
                      child: const Text('Isi data Anda')),
                  Obx(() => controller.isOpen.value ? isiForm() : Container()),
                  const SizedBox(height: 32),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        // Handle booking action
                        controller.bookingJadwal(poli);
                      },
                      child: const Text(
                        'Booking Sekarang',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _formatTimestamp(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}';
  }
}

Widget isiForm() {
  final c = Get.put(DetailPoliUserController());
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    ),
    child: Column(
      children: [
        _buildTextField(
          controller: c.namaController,
          label: 'Nama Pasien',
        ),
        _buildTextField(
          controller: c.alamatController,
          label: 'Alamat Pasien',
        ),
        _buildTextField(
          controller: c.noteleponController,
          label: 'Kontak Pasien',
        ),
      ],
    ),
  );
}

Widget _buildTextField({
  required TextEditingController controller,
  required String label,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      autocorrect: false,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    ),
  );
}
