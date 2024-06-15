import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polirs_uas4/app/data/model/jadwalpolimodel.dart';

class TambahPoliController extends GetxController {
  TextEditingController namaDokterController = TextEditingController();
  TextEditingController spesialisController = TextEditingController();
  TextEditingController lokasiController = TextEditingController();
  TextEditingController kontakController = TextEditingController();
  TextEditingController codePoliController = TextEditingController();
  TextEditingController informasiTambahanController = TextEditingController();
  DateTime? selectedDate;
  RxBool isLoading = false.obs;

  CollectionReference poliCollection =
      FirebaseFirestore.instance.collection('jadwal-poli');

  Future<void> tambahPoli() async {
    isLoading.value = true;

    try {
      final poliModel = JadwalPoli(
        codePoli: codePoliController.text,
        namaDokter: namaDokterController.text,
        spesialis: spesialisController.text,
        jamPraktek: Timestamp.fromMicrosecondsSinceEpoch(selectedDate!.day),
        lokasi: lokasiController.text,
        kontak: kontakController.text,
        // informasiTambahan: informasiTambahanController.text,
      );

      var hasil = await poliCollection.add(poliModel.toJson());
      await poliCollection.doc(hasil.id).update({'codePoli': hasil.id});

      Get.showSnackbar(const GetSnackBar(
        title: 'Success',
        message: 'Berhasil Menambahkan Jadwal',
        duration: Duration(seconds: 2),
      ));
    } catch (e) {
      log('Error membuat jadwal ---> $e');
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: 'Gagal Menambahkan Jadwal: $e',
        duration: const Duration(seconds: 2),
      ));
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void dispose() {
    @override
    void dispose() {
      namaDokterController.dispose();
      spesialisController.dispose();
      lokasiController.dispose();
      kontakController.dispose();
      informasiTambahanController.dispose();
      super.dispose();
    }

    super.dispose();
  }
}
