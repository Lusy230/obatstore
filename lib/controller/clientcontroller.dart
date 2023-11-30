import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';


class ClientController extends GetxController {
  late Client client;

  @override
  void onInit() {
    super.onInit();

    client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('656832c23f32454e906')
        .setSelfSigned(status: true); // For self signed certificates, only use for development
  }
}
