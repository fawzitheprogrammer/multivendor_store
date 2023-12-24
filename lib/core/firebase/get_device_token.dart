import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  static Future<void> requestPermission() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );
    // Check the status and inform the user
  }

  static Future<String?> getDeviceToken() async {
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (e) {
      print('Error getting token: $e');
      return null;
    }
  }

  // Other notification-related methods
}
