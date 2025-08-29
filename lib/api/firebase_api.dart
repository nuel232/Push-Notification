import 'package:firebase_messaging/firebase_messaging.dart';

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
  }

  //function to handle received messages

  //function to initialize foreground and background settings
}
