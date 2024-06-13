import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polirs_uas4/app/data/model/usermodel.dart';
import 'package:polirs_uas4/app/routes/app_pages.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isAdmin = false.obs;

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  bool _isAdmin = false; // Inisialisasi sebagai false

  // Setter untuk isAdmin
  set isAdminFunc(bool value) {
    _isAdmin = value;
  }

  Future<bool> isDuplicateEmail(String email) async {
    final users = await userCollection.get();
    return users.docs.any((e) => e['email'] == email);
  }

  Future<void> register(
      {required bool isAdmin,
      required String userName,
      required String email,
      required String password}) async {
    isLoading.value = true;
    try {
      if (await isDuplicateEmail(email)) {
        Get.snackbar(
          'Something Went Wrong',
          'Maaf, Email Sudah Terdaftar',
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        );
        isLoading.value = false;
        return;
      }

      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _isAdmin = isAdmin;

      final userModel = UserModel(
        userName: userName,
        email: email,
        uid: credential.user?.uid ?? '',
        password: password,
        isAdmin: _isAdmin,
      );

      await userCollection.doc(userModel.uid).set(userModel.toJson());

      Get.showSnackbar(const GetSnackBar(
        // backgroundColor: Colors.white,
        title: 'Berhasil Register',
        message: 'Diarahkan Ke Halaman Login',
        duration: Duration(seconds: 2),
      )).future.then((value) => Get.offAllNamed(Routes.LOGIN));
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Something Went Wrong',
          'Maaf, Password Kurang',
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Something Went Wrong',
          'Maaf, Email Sudah Terdaftar',
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e, st) {
      isLoading.value = false;
      log('Error from $e, stack trace $st');
      Get.snackbar(
        'Something Went Wrong',
        'Sorry, $e',
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      );
    }
    isLoading.value = false;
  }

  Future<void> login(String email, String password) async {
    try {
      Get.defaultDialog(
        content: const CircularProgressIndicator(),
        title: 'Loading...',
      );

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userDoc = await userCollection.doc(credential.user?.uid).get();

      if (userDoc.exists) {
        final data = userDoc.data() as Map<String, dynamic>?;

        if (data != null) {
          final isAdmin = data['isAdmin'] ?? false;
          if (isAdmin) {
            Get.offAllNamed(Routes.ADMIN);
          } else {
            Get.offAllNamed(Routes.HOME);
          }
        } else {
          print('Data pengguna kosong');
        }
      } else {
        print('Dokumen pengguna tidak ditemukan');
      }
    } on FirebaseAuthException catch (e) {
      Get.back(); // Dismiss the loading dialog
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Login Failed',
          'No user found for that email.',
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Login Failed',
          'Wrong password provided for that user.',
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      Get.back(); // Dismiss the loading dialog
      Get.snackbar(
        'Login Failed',
        'Error: $e',
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  String _determineHomeRoute(String uid) {
    // Mendapatkan data pengguna dari Firestore
    userCollection.doc(uid).get().then((userDoc) {
      if (userDoc.exists) {
        final data = userDoc.data() as Map<String, dynamic>;
        if (data != null) {
          final isAdmin = data['isAdmin'] ?? false;
          if (isAdmin) {
            return Routes.ADMIN;
          } else {
            return Routes.HOME;
          }
        }
      }
    }).catchError((error) {
      log('Error determining home route: $error');
    });
    return Routes.LOGIN;
  }

  String get autoLoginRoute {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return _determineHomeRoute(user.uid);
    } else {
      return Routes.LOGIN;
    }
  }
}
