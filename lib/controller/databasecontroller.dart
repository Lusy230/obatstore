import 'package:apotek/controller/clientcontroller.dart';
import 'package:appwrite/appwrite.dart';

class DatabaseController extends ClientController {
  
void createDocument(String diskon) async {
  final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('656832c23f32454e9069');

  final databases = Databases(client);

  final response = await databases.createDocument(
    databaseId: 'obatshop',
    collectionId: 'obatshop',
    data: {
      'diskon': diskon,
    }, documentId: '',
  );

  print('Document created: ${response.data}');
}

}