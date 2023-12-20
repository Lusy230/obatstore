import 'package:flutter/material.dart';
import 'package:apotek/controller/databasecontroller.dart';
import 'package:get/get.dart';

class VoucherPage extends StatefulWidget {
  @override
  _VoucherPageState createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController updateController = TextEditingController();
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _readVoucher(context);
              },
              child: Text('Baca Voucher'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: updateController,
                    decoration: InputDecoration(labelText: 'Nilai Diskon Baru'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // _updateVoucher(context);
                  },
                  child: Text('Perbarui Voucher'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // _deleteVoucher(context);
              },
              child: Text('Hapus Voucher'),
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
        content: Text('Voucher "$voucherName" berhasil digunakan!'),
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

void _readVoucher(BuildContext context) async {
  // Read voucher from the database
  String documentId = 'obatshop'; // Replace with the actual documentId
  try {
    Map<String, dynamic> voucher = await databaseController.readDocument(documentId);

    // Display voucher data in a pop-up
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Voucher Information'),
          content: Text('Voucher: ${voucher['voucherName']}'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  } catch (e) {
    // Handle error, e.g., document not found
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: Voucher tidak ditemukan.'),
      ),
    );
  }
}

void _updateReview(Map<String, dynamic> review) {
  String documentId = review['\$id'];
  _updateVoucher(context, documentId);
}

void _updateVoucher(BuildContext context, String documentId) async {
  String newDiskon = updateController.text.trim();

  try {
    await databaseController.updateDocument(documentId, newDiskon);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Voucher berhasil diperbarui!'),
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Gagal memperbarui voucher. Error: $e'),
      ),
    );
  }
}


void _deleteReview(Map<String, dynamic> review) {
  String documentId = review['\$id'];
  _deleteVoucher(context, documentId);
}

void _deleteVoucher(BuildContext context, String documentId) async {
  try {
    await databaseController.deleteDocument(documentId);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Voucher berhasil dihapus!'),
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Gagal menghapus voucher. Error: $e'),
      ),
    );
  }
}

}