import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_notifications/main.dart';

class FirebaseApi {
  //create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  //function to initialize firebase app
  Future<void> initNotification() async {
    //request permission for USER
    await _firebaseMessaging.requestPermission();

    //FETCH THE fcm TOKEN FOR THIS DEVICE
    final FCMToken = await _firebaseMessaging.getToken();

    //PRINT THE TOKEN (NORMALLY YOU WILL SEND THIS TO YOUR SERVER)
    print('FCM Token: $FCMToken');

    initPushNotifications();
  }

  //function to handle received messages
  void handleMessage(RemoteMessage? messages) {
    //if the message is null do nothing
    if (messages == null) return;

    //navigate to new screen when message is received and user taps notification
    navigatorKey.currentState?.pushNamed(
      '/notification_screen',
      //passing through our message
      arguments: messages,
    );
  }

  //function to initialize foreground and background settings
  Future initPushNotifications() async {
    //handle notification if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    //attach event listeners for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
