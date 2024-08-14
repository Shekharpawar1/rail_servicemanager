// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBI1v7c9W3Pmrvxh5at65lS7DPJe1q6BIg',
    appId: '1:65579654892:web:613710ece1fa2d1b208fc9',
    messagingSenderId: '65579654892',
    projectId: 'servicemanager-98b27',
    authDomain: 'servicemanager-98b27.firebaseapp.com',
    storageBucket: 'servicemanager-98b27.appspot.com',
    measurementId: 'G-NH06MPTNFR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIxwZd8dVWg7ocPQ7XxtIAKf1GdcHjpSw',
    appId: '1:65579654892:android:ab82c703acd92127208fc9',
    messagingSenderId: '65579654892',
    projectId: 'servicemanager-98b27',
    storageBucket: 'servicemanager-98b27.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCUFT-jA9vLxNhIhF5eUOKumm1MFCyP6rM',
    appId: '1:65579654892:ios:ba28824551d135b5208fc9',
    messagingSenderId: '65579654892',
    projectId: 'servicemanager-98b27',
    storageBucket: 'servicemanager-98b27.appspot.com',
    iosBundleId: 'com.techpanda.servicemanagers',
  );

}