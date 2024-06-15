import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polirs_uas4/app/modules/home/controllers/home_controller.dart';

import '../../detail-poli-user/model/booking_model.dart';
import '../controllers/histori_booking_controller.dart';

class HistoriBookingView extends GetView<HistoriBookingController> {
  HistoriBookingView({super.key});

  final c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histori Tiket Booking'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: c.streamSelesai(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('History Kosong'));
          }

          List<Booking> allBooking = [];

          for (var e in snapshot.data!.docs) {
            var data = e.data();
            if (data != null) {
              allBooking.add(Booking.fromJson(data));
            }
          }

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: allBooking.length,
            itemBuilder: (context, index) {
              Booking data = allBooking[index];
              return InkWell(
                child: Container(
                  padding: const EdgeInsets.all(20),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dokter: ${data.namaDokter}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Spesialis: ${data.spesialis}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Nama Pasien: ${data.nama}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text('Status: '),
                              Text(' Success'),
                              const Icon(
                                Icons.check_circle_outline,
                                size: 30,
                                color: Colors.green,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Column(
                        children: [
                          Text(
                            _formatTimestamp(data.tanggalBooking),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const SizedBox(height: 15),
                          
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

String _formatTimestamp(Timestamp timestamp) {
  DateTime date = timestamp.toDate();
  return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}';
}
