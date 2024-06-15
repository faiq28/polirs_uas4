import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class ScanController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var scannedCode = ''.obs;

  void handleQRCodeResult(String barcodeScanRes) async {
    WriteBatch batch = firestore.batch();

    try {
      QuerySnapshot bookingSnapshot = await firestore
          .collection('booking')
          .where('codePoli', isEqualTo: barcodeScanRes)
          .get();

      if (bookingSnapshot.docs.isNotEmpty) {
        for (var bookingDoc in bookingSnapshot.docs) {
          Object? bookingData = bookingDoc.data();
          batch.delete(bookingDoc.reference);

          CollectionReference selesaiCollection =
              firestore.collection('selesai');
          batch.set(selesaiCollection.doc(), bookingData);
        }

        await batch.commit();

        print(
            'Data dengan kode poli $barcodeScanRes berhasil dipindahkan dari "booking" ke "selesai".');
      } else {
        print(
            'Dokumen dengan kode poli $barcodeScanRes tidak ditemukan dalam koleksi "booking".');
      }
    } catch (error) {
      print('Terjadi kesalahan: $error');
    }
  }
}
