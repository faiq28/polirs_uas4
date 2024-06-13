import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

JadwalPoli jadwalPoliFromJson(String str, String id) =>
    JadwalPoli.fromJson(json.decode(str), id);

String jadwalPoliToJson(JadwalPoli data) => json.encode(data.toJson());

class JadwalPoli {
  String namaDokter;
  String codePoli;
  String spesialis;
  Timestamp jamPraktek; // Changed to Timestamp
  String lokasi;
  String kontak;
  String informasiTambahan;
  

  JadwalPoli({
    required this.namaDokter,
    required this.codePoli,
    required this.spesialis,
    required this.jamPraktek,
    required this.lokasi,
    required this.kontak,
    required this.informasiTambahan,
  });

  factory JadwalPoli.fromJson(Map<String, dynamic> json, String id) =>
      JadwalPoli(
        namaDokter: json["namaDokter"] ?? '',
        codePoli: json["codePoli"] ?? '',
        spesialis: json["spesialis"] ?? '',
        jamPraktek:
            json["jamPraktek"] ?? Timestamp.now(), // Ensure Timestamp type
        lokasi: json["lokasi"] ?? '',
        kontak: json["kontak"] ?? '',
        informasiTambahan: json["informasiTambahan"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "namaDokter": namaDokter,
        "codePoli": codePoli,
        "spesialis": spesialis,
        "jamPraktek": jamPraktek,
        "lokasi": lokasi,
        "kontak": kontak,
        "informasiTambahan": informasiTambahan,
      };
}
