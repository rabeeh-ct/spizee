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
        return windows;
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
    apiKey: 'AIzaSyD2zPMUK6QPteUw1wjirIvC_UpG0G5uFmE',
    appId: '1:703622540021:web:681f6b537726636296f3bc',
    messagingSenderId: '703622540021',
    projectId: 'spizee-8a567',
    authDomain: 'spizee-8a567.firebaseapp.com',
    storageBucket: 'spizee-8a567.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0cWMnW9gwGgmpvhUOleNH98xCcMqSK5w',
    appId: '1:703622540021:android:2c2a999dfdee936296f3bc',
    messagingSenderId: '703622540021',
    projectId: 'spizee-8a567',
    storageBucket: 'spizee-8a567.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBta1v1UOxNM_02p9gD1jz1u6rpJftV9HU',
    appId: '1:703622540021:ios:fbe04d375d369b9896f3bc',
    messagingSenderId: '703622540021',
    projectId: 'spizee-8a567',
    storageBucket: 'spizee-8a567.appspot.com',
    iosBundleId: 'com.example.spizee',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD2zPMUK6QPteUw1wjirIvC_UpG0G5uFmE',
    appId: '1:703622540021:web:0dcc07953a6f4da596f3bc',
    messagingSenderId: '703622540021',
    projectId: 'spizee-8a567',
    authDomain: 'spizee-8a567.firebaseapp.com',
    storageBucket: 'spizee-8a567.appspot.com',
  );
}
