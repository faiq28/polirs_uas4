import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polirs_uas4/app/data/model/jadwalpolimodel.dart';
import 'package:polirs_uas4/app/routes/app_pages.dart';

class DetailPoliUserController extends GetxController {
  RxBool isOpen = false.obs;
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController noteleponController = TextEditingController();

  CollectionReference bookingCollection =
      FirebaseFirestore.instance.collection('booking');

  bookingJadwal(JadwalPoli poli) async {
    // Check if any field is empty
    if (namaController.text.isEmpty ||
        alamatController.text.isEmpty ||
        noteleponController.text.isEmpty) {
      Get.snackbar(
        "Data Incomplete",
        "Harap isi data diri",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return; // Stop execution if any field is empty
    }

    Map<String, dynamic> bookingData = {
      "namaDokter": poli.namaDokter,
      "codePoli": poli.codePoli,
      "jam": poli.jamPraktek,
      "spesialis": poli.spesialis,
      "nama": namaController.text,
      "alamat": alamatController.text,
      "tanggalBooking": DateTime.now(),
      "notelepon": noteleponController.text,
    };

    // Save the booking data to Firestore
    try {
      var hasil = await bookingCollection.add(bookingData);
      await bookingCollection.doc(hasil.id).update({'codePoli': hasil.id});

      Get.snackbar(
        "Booking Successful",
        "Your booking has been added successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar(
        "Booking Failed",
        "There was an error while booking: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
