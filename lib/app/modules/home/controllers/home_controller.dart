import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamBooking() async* {
    yield* firestore.collection('booking').snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamSelesai() async* {
    yield* firestore.collection('selesai').snapshots();
  }
}
