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
    apiKey: 'AIzaSyAp2IvzKTtvcZ3TJJO8llMs-7HhZGfQVJ0',
    appId: '1:303000054358:web:66078f4bb453728b1929f7',
    messagingSenderId: '303000054358',
    projectId: 'mizam-app',
    authDomain: 'mizam-app.firebaseapp.com',
    storageBucket: 'mizam-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCGCT5AT7uACTjOcRvmAM3kU-l2emrWdq8',
    appId: '1:303000054358:android:027c8a69a054b9d51929f7',
    messagingSenderId: '303000054358',
    projectId: 'mizam-app',
    storageBucket: 'mizam-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDfEIKIPUYe7Kdz2gNBBPXmNXshlOlSSWQ',
    appId: '1:303000054358:ios:ae6db0dfe2cd07291929f7',
    messagingSenderId: '303000054358',
    projectId: 'mizam-app',
    storageBucket: 'mizam-app.appspot.com',
    iosClientId: '303000054358-jucgi41s4kttbskikr26cl48tkjdjj0o.apps.googleusercontent.com',
    iosBundleId: 'com.example.mizamApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDfEIKIPUYe7Kdz2gNBBPXmNXshlOlSSWQ',
    appId: '1:303000054358:ios:68891defa71615bf1929f7',
    messagingSenderId: '303000054358',
    projectId: 'mizam-app',
    storageBucket: 'mizam-app.appspot.com',
    iosClientId: '303000054358-i8qm9a95g725d9ijjv93fds0bhaumrhu.apps.googleusercontent.com',
    iosBundleId: 'com.example.mizamApp.RunnerTests',
  );
}