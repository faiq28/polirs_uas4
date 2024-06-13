// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/artikel_controller.dart';

class ArtikelView extends GetView<ArtikelController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArtikelView'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 109, 131, 255),
                      Color.fromARGB(255, 118, 180, 255)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 50),
                        const Text(
                          'Terdapat beberapa sakit umum yang di alami\nmasyarakat di indonesia ',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'Jadi kalian sebagai masyarakat indonesia patut untuk berjaga jaga\nagar tidak terkena penyakit',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Penyakit Menular:',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Container(
                              height: 2,
                              width: lebar,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFF7B61FF), Colors.blue],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "1. Demam Berdarah Dengue (DBD):",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Penyakit yang disebabkan oleh virus dengue yang ditularkan oleh nyamuk Aedes aegypti.",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "2. Malaria:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Penyakit yang ditularkan oleh nyamuk Anopheles, terutama di daerah tropis dan subtropis.",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "3. Tuberkulosis (TBC):",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Penyakit infeksi bakteri Mycobacterium tuberculosis yang terutama menyerang paru-paru.",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "4. Influenza:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Penyakit pernapasan yang disebabkan oleh virus influenza.",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "5. Infeksi Saluran Pernapasan Akut (ISPA):",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Penyakit infeksi yang menyerang saluran pernapasan atas dan bawah.",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Penyakit Tidak Menular:',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Container(
                              height: 2,
                              width: lebar,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFF7B61FF), Colors.blue],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "1. Hipertensi (Tekanan Darah Tinggi):",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Kondisi tekanan darah yang terus-menerus tinggi, yang dapat meningkatkan risiko penyakit jantung dan stroke.",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "2. Diabetes Mellitus:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Penyakit kronis yang ditandai dengan kadar gula darah yang tinggi.",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "3. Penyakit Jantung Koroner:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Penyakit yang disebabkan oleh penyempitan atau penyumbatan pembuluh darah koroner yang memasok darah ke jantung.",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "4. Stroke:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Gangguan aliran darah ke otak yang menyebabkan kerusakan jaringan otak.",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "5. Obesitas:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Kondisi kelebihan berat badan yang dapat meningkatkan risiko penyakit jantung, diabetes, dan penyakit lainnya.",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      // Add more sections as needed
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
