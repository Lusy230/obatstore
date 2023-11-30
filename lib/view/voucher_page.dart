import 'package:flutter/material.dart';
import 'package:apotek/controller/databasecontroller.dart';

class VoucherPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final DatabaseController databaseController = DatabaseController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Voucher'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Masukkan Nama Voucher'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _submitVoucher(context);
              },
              child: Text('Gunakan'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitVoucher(BuildContext context) {
    String voucherName = nameController.text.trim();

    if (voucherName.isNotEmpty) {
      // Store voucher name in the database
      databaseController.createDocument(voucherName);

      // Show success message or navigate to another page if needed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Voucher submitted successfully!'),
        ),
      );
    } else {
      // Show an error if the voucher name is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Nama Voucher tidak boleh kosong!'),
        ),
      );
    }
  }
}
