import 'package:apotek/controller/clientcontroller.dart';
import 'package:appwrite/appwrite.dart';

class DatabaseController extends ClientController {
  final String databaseId = 'obatshop';
  final String collectionId = 'obatshop';

  Future<void> createDocument(String diskon) async {
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('656832c23f32454e9069');

    final databases = Databases(client);

    final response = await databases.createDocument(
      databaseId: 'obatshop',
      collectionId: 'obatshop',
      data: {
        'diskon': diskon,
      },
      documentId: '',
    );

    print('Document created: ${response.data}');
  }

  Future<Map<String, dynamic>> readDocument(String documentId) async {
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('656832c23f32454e9069');

    final databases = Databases(client);

    final response = await databases.getDocument(
      databaseId: 'obatshop',
      collectionId: 'obatshop',
      documentId: '65708204c0f192a6e53c',
    );

    print('Document read: ${response.data}');

    return response.data;
  }

  Future<void> updateDocument(String documentId, String newDiskon) async {
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('656832c23f32454e9069');

    final databases = Databases(client);

    final response = await databases.updateDocument(
      databaseId: 'obatshop',
      collectionId: 'obatshop',
      documentId: '65708204c0f192a6e53c',
      data: {
        'diskon': newDiskon,
      },
    );

    print('Document updated: ${response.data}');
  }

  Future<void> deleteDocument(String documentId) async {
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('656832c23f32454e9069');

    final databases = Databases(client);

    final response = await databases.deleteDocument(
      databaseId: 'obatshop',
      collectionId: 'obatshop',
      documentId: '65708204c0f192a6e53c',
    );

    print('Document deleted: ${response.data}');
  }
}
