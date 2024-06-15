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
      backgroundColor: Colors.grey.shade200, // Same as PoliUserView
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), // Round all corners
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
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
                  // const SizedBox(height: 16),
                  // Text(
                  //   'Informasi Tambahan: ${poli.informasiTambahan}',
                  //   style: const TextStyle(fontSize: 18),
                  // ),
                  const SizedBox(height: 32),
                  const Text(
                    'Harap isi data diri anda apa bila ingin booking poli untuk hari ini',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  // const SizedBox(height: 6),
                  isiForm(),
                  const SizedBox(height: 32),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 130,
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
      color: Colors.white,
      borderRadius: BorderRadius.circular(20), // Round all corners
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.3),
      //     spreadRadius: 3,
      //     blurRadius: 5,
      //     offset: const Offset(0, 3),
      //   ),
      // ],
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
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(50.0),
        // ),
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
