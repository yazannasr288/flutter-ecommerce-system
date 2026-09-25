import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../controller/orders/pandingcontroller.dart';

final player = AudioPlayer();

Future<void> playNotificationSound() async {
  await player.play(AssetSource('h.mp3'));
}

requestpermationnotifi() async {
  NotificationSettings settings = await FirebaseMessaging.instance
      .requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
}

fcmconfig() {
  FirebaseMessaging.onMessage.listen((massage) async {
    await playNotificationSound();
    print("===============noti============");
    print(massage.notification!.title);
    print(massage.notification!.body);

    Get.snackbar(massage.notification!.title!, massage.notification!.body!);
    refreshnotifi(massage.data);
  });
}

refreshnotifi(data) {
  print("==============================");

  print(data['page_id']);
  print(data['page_name']);
  print(Get.currentRoute);
  if(Get.currentRoute=="/panding" && data['page_name']=="order"){
Pandingcontroller controller =Get.find();
controller.refreshorder();
  }
}
