// File generated manually for Firebase configuration
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
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAvVXmxU_ZY81PllGtkc7IuMiHQ0rb2DbQ',
    appId: '1:498083145646:android:603906a49b78cf446a8a3f',
    messagingSenderId: '498083145646',
    projectId: 'portal-berita-57dca',
    storageBucket: 'portal-berita-57dca.firebasestorage.app',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDRtbfmF0YUbAWYBmNwpaVl34a9KuizTHs',
    appId: '1:498083145646:web:36334ca9f5c3f7a96a8a3f',
    messagingSenderId: '498083145646',
    projectId: 'portal-berita-57dca',
    authDomain: 'portal-berita-57dca.firebaseapp.com',
    storageBucket: 'portal-berita-57dca.firebasestorage.app',
    measurementId: 'G-HYQ55Q0TTJ',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCl1Je3dowgqA3U9EOdRGHU5jisF2k1QIs',
    appId: '1:498083145646:ios:c96a9202812492e46a8a3f',
    messagingSenderId: '498083145646',
    projectId: 'portal-berita-57dca',
    storageBucket: 'portal-berita-57dca.firebasestorage.app',
    iosBundleId: 'com.example.portalBerita',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCl1Je3dowgqA3U9EOdRGHU5jisF2k1QIs',
    appId: '1:498083145646:ios:c96a9202812492e46a8a3f',
    messagingSenderId: '498083145646',
    projectId: 'portal-berita-57dca',
    storageBucket: 'portal-berita-57dca.firebasestorage.app',
    iosBundleId: 'com.example.portalBerita',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDRtbfmF0YUbAWYBmNwpaVl34a9KuizTHs',
    appId: '1:498083145646:web:a43eb0240a0b89106a8a3f',
    messagingSenderId: '498083145646',
    projectId: 'portal-berita-57dca',
    authDomain: 'portal-berita-57dca.firebaseapp.com',
    storageBucket: 'portal-berita-57dca.firebasestorage.app',
    measurementId: 'G-NKWVCBK3SJ',
  );

}