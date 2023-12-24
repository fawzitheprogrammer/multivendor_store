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
    apiKey: 'AIzaSyBOOvNd5N-oGrjgHEJrMnjiZN6fz6XiojE',
    appId: '1:873515213534:web:024bb6f29cb916f2a4984f',
    messagingSenderId: '873515213534',
    projectId: 'wavemall',
    authDomain: 'wavemall.firebaseapp.com',
    storageBucket: 'wavemall.appspot.com',
    measurementId: 'G-WVJ919QE2Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_29KaBWqPBsN1_f_Lorg4qzTcuua0Erw',
    appId: '1:873515213534:android:09c9b88700f6ee3ea4984f',
    messagingSenderId: '873515213534',
    projectId: 'wavemall',
    storageBucket: 'wavemall.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_RrNHkVfCFJx3nBdVaSiq2It15igvsvg',
    appId: '1:873515213534:ios:a09617d2b1c5e166a4984f',
    messagingSenderId: '873515213534',
    projectId: 'wavemall',
    storageBucket: 'wavemall.appspot.com',
    iosClientId: '873515213534-ikfpet61lhojvk2t4oa5ak09e15nqubs.apps.googleusercontent.com',
    iosBundleId: 'com.wavemall.store',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_RrNHkVfCFJx3nBdVaSiq2It15igvsvg',
    appId: '1:873515213534:ios:37960bc70e3f009ea4984f',
    messagingSenderId: '873515213534',
    projectId: 'wavemall',
    storageBucket: 'wavemall.appspot.com',
    iosClientId: '873515213534-sbah8t3v79bruqbd94ejjk7udd2vb713.apps.googleusercontent.com',
    iosBundleId: 'com.wavemall.store.RunnerTests',
  );
}
