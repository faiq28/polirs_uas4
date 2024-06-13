import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

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
}
