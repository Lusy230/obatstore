// auth_controller.dart

import 'package:apotek/view/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs; // New variable to track user login status

  Future<void> registerUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Set isLoggedIn to true upon successful registration
      isLoggedIn.value = true;
      Get.snackbar('Success', 'Registration successful',
          backgroundColor: Colors.green);
      Get.offAll(LogInPage()); // Navigate to Login Page
    } catch (error) {
      Get.snackbar('Error', 'Registration failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Set isLoggedIn to true upon successful registration
      isLoggedIn.value = true;
      Get.snackbar('Success', 'Registration successful',
          backgroundColor: Colors.green);
      Get.offAll(LogInPage()); // Navigate to Login Page
    } catch (error) {
      Get.snackbar('Error', 'Registration failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      isLoggedIn.value = false; // Set isLoggedIn to false upon logout
      Get.snackbar('Success', 'Logout successful',
          backgroundColor: Colors.green);
      Get.offAll(LogInPage()); // Navigate to Login Page and clear previous routes
    } catch (error) {
      Get.snackbar('Error', 'Logout failed: $error',
          backgroundColor: Colors.red);
    }
  }
}
