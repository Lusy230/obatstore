import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';


class ClientController extends GetxController {
  late Client client;
  late Databases databases;

  @override
  void onInit() {
    

    client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('656832c23f32454e906')
        .setSelfSigned(status: true); 
        
        databases = Databases(client);
        super.onInit();
  }
}
