import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:polirs_uas4/app/data/model/jadwalpolimodel.dart';

class PoliUserController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxBool status = false.obs;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamJadwalPoli() async* {
    yield* firestore.collection('jadwal-poli').snapshots();
  }

  deletePoli(String id) async {
    try {
      await firestore.collection('jadwal-poli').doc(id).delete();
    } catch (e) {
      log('gagal mendelete poli $e');
    }
  }

  Future<void> updatePoli(JadwalPoli updatedPoli) async {
    try {
      await FirebaseFirestore.instance
          .collection('jadwal-poli')
          .doc(updatedPoli.codePoli)
          .update(updatedPoli.toJson());
      Get.snackbar('Success', 'Jadwal Poli updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update Jadwal Poli: $e');
    }
  }
}
