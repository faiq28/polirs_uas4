// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/artikel_controller.dart';

class ArtikelView extends GetView<ArtikelController> {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArtikelView'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terdapat beberapa sakit umum yang di alami masyarakat di indonesia',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Jadi kalian sebagai masyarakat indonesia patut untuk berjaga jaga agar tidak terkena penyakit',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Contoh sakit yang sering di alami masyarakat indonesia',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Demam',
                      style: TextStyle(fontSize: 16),
                    ),
                    Center(
                      child: Image.asset(
                        'images/demam.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Text(
                      'Demam adalah kondisi di mana suhu tubuh seseorang naik di atas kisaran normal, biasanya sebagai respons terhadap infeksi atau penyakit lainnya. Suhu tubuh normal manusia berkisar antara 36.1°C hingga 37.2°C. Demam sendiri bukanlah penyakit, tetapi merupakan gejala dari kondisi medis yang mendasarinya.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 16),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2. Diare',
                      style: TextStyle(fontSize: 16),
                    ),
                    Center(
                      child: Image.asset(
                        'images/diare.jpeg',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Text(
                      'Diare adalah kondisi medis yang ditandai dengan peningkatan frekuensi buang air besar (lebih dari tiga kali sehari) dengan tinja yang lebih cair atau berair daripada biasanya. Diare bisa berlangsung dalam waktu singkat (akut) atau berkelanjutan dalam jangka panjang (kronis).',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 16),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '3. Cacingan',
                      style: TextStyle(fontSize: 16),
                    ),
                    Center(
                      child: Image.asset(
                        'images/cacingan.jpeg',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Text(
                      'Cacingan adalah infeksi parasit akibat cacing yang hidup di dalam tubuh manusia, terutama di usus. Infeksi ini dapat terjadi melalui konsumsi makanan atau air yang terkontaminasi, atau kontak dengan tanah yang mengandung telur atau larva cacing. Jenis cacing yang umum meliputi cacing gelang, cacing tambang, cacing kremi, dan cacing pita.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 16),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '4. Malaria',
                      style: TextStyle(fontSize: 16),
                    ),
                    Center(
                      child: Image.asset(
                        'images/malaria.jpeg',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Text(
                      'Malaria adalah penyakit menular yang disebabkan oleh parasit Plasmodium dan ditularkan melalui gigitan nyamuk Anopheles betina. Gejalanya meliputi demam, menggigil, dan sakit kepala. Pencegahan meliputi penggunaan kelambu dan obat antimalaria, sementara pengobatannya menggunakan ACTs. Penyakit ini umum di daerah tropis dan subtropis.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 16),
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
