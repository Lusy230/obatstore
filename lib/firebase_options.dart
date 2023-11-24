// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAzVTUY-Z-3Z0kJmkVf6-Jb8d0yuWeZQtg',
    appId: '1:323202766982:web:48a841e4fb1fd795779907',
    messagingSenderId: '323202766982',
    projectId: 'projectku-aa6e7',
    authDomain: 'projectku-aa6e7.firebaseapp.com',
    storageBucket: 'projectku-aa6e7.appspot.com',
    measurementId: 'G-YC5Y2BBGHM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYjqsO11ReQlXVsXom94tBVMU70YdD56k',
    appId: '1:323202766982:android:0c7dd47a8d310943779907',
    messagingSenderId: '323202766982',
    projectId: 'projectku-aa6e7',
    storageBucket: 'projectku-aa6e7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAuO_iAOpk8z4EROpZN6JsxIMUYwE90mZ4',
    appId: '1:323202766982:ios:abf33c1d6f678acf779907',
    messagingSenderId: '323202766982',
    projectId: 'projectku-aa6e7',
    storageBucket: 'projectku-aa6e7.appspot.com',
    iosClientId: '323202766982-4qvp4fr9p8h9aabeuukl916vujo9hlnl.apps.googleusercontent.com',
    iosBundleId: 'com.example.apotek',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAuO_iAOpk8z4EROpZN6JsxIMUYwE90mZ4',
    appId: '1:323202766982:ios:102806020aa6d8fb779907',
    messagingSenderId: '323202766982',
    projectId: 'projectku-aa6e7',
    storageBucket: 'projectku-aa6e7.appspot.com',
    iosClientId: '323202766982-osj7ivfou4aluirjnkbpsl2f5q0kapge.apps.googleusercontent.com',
    iosBundleId: 'com.example.apotek.RunnerTests',
  );
}