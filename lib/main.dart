import 'package:apotek/firebase_options.dart';
import 'package:apotek/models/pembelian_model.dart';
import 'package:apotek/view/akun_page.dart';
import 'package:apotek/view/dashboard_page.dart';
import 'package:apotek/view/histori_page.dart';
import 'package:apotek/view/home_page.dart';
import 'package:apotek/view/keranjang_page.dart';
import 'package:apotek/view/login_page.dart';
import 'package:apotek/view/notification_handler.dart';
import 'package:apotek/view/pembelian_page.dart';
import 'package:apotek/view/sign_in_page.dart';
import 'package:apotek/view/voucher_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  await FirebaseMessagingHandler().initPushNotification();
  await FirebaseMessagingHandler().initLocalNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/signIn': (context) => SignInPage(),
        '/logIn': (context) => LogInPage(),
        '/dashboard': (context) => DashboardPage(),
        '/pembelian': (context) => PurchasePage(),
        '/voucher': (context) => VoucherPage(),
        '/histori': (context) => HistoriPage(),
        '/akun': (context) => AkunPage(),
        '/keranjang': (context) => KeranjangPage(selectedItems: [], prices: []),
      },
    );
  }
}
