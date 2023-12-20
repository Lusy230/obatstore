import 'package:apotek/controller/clientcontroller.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatabaseController extends ClientController {
  @override
  void onInit() {
    super.onInit();
    // appwrite initialization
  }

  Future<void> createDocument(String voucherName) async {
    try {
      final result = await databases.createDocument(
        databaseId: '657b1c8f90ae0db4594d',
        documentId: ID.unique(),
        collectionId: '657b1ca93c2acbd9022d',
        data: {'voucherName': voucherName},
        permissions: [
          Permission.read(Role.any()),
          Permission.update(Role.any()),
          Permission.delete(Role.any()),
        ],
      );
      print("DatabaseController:: createDocument $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "Error storing voucher data: $error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future<Map<String, dynamic>> readDocument(String documentId) async {
    try {
      final response = await databases.getDocument(
        databaseId: '657b1c8f90ae0db4594d',
        documentId: documentId,
        collectionId: '657b1ca93c2acbd9022d',
      );
      return response.data;
    } catch (error) {
      throw Exception('Error fetching voucher data: $error');
    }
  }

  Future<void> updateDocument(String documentId, String newDiskon) async {
    try {
      final result = await databases.updateDocument(
        databaseId: '657b1c8f90ae0db4594d',
        documentId: documentId,
        data: {'newDiskon': newDiskon},
        collectionId: '657b1ca93c2acbd9022d',
      );
      print("DatabaseController:: updateDocument $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "Error updating voucher data: $error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future<void> deleteDocument(String documentId) async {
    try {
      final result = await databases.deleteDocument(
        databaseId: '657b1c8f90ae0db4594d',
        documentId: documentId,
        collectionId: '657b1ca93c2acbd9022d',
      );
      print("DatabaseController:: deleteDocument $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "Error deleting voucher data: $error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }
}
