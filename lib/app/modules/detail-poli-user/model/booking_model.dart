// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
  String codePoli;
  String namaDokter;
  String spesialis;
  String nama;
  String alamat;
  String notelepon;
  Timestamp jam;
  Timestamp tanggalBooking;

  Booking({
    required this.codePoli,
    required this.namaDokter,
    required this.spesialis,
    required this.tanggalBooking,
    required this.nama,
    required this.alamat,
    required this.notelepon,
    required this.jam,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        codePoli: json["codePoli"],
        namaDokter: json["namaDokter"],
        tanggalBooking: json["tanggalBooking"],
        spesialis: json["spesialis"],
        nama: json["nama"],
        alamat: json["alamat"],
        notelepon: json["notelepon"],
        jam: json["jam"],
      );

  Map<String, dynamic> toJson() => {
        "codePoli": codePoli,
        "namaDokter": namaDokter,
        "tanggalBooking": tanggalBooking,
        "spesialis": spesialis,
        "nama": nama,
        "alamat": alamat,
        "notelepon": notelepon,
        "jam": jam,
      };
}
