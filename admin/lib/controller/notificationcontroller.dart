import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../data/datasource/remote/notificationdata.dart';
import 'handlingdatacontroller.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  TextEditingController title = TextEditingController();
  TextEditingController message = TextEditingController();

  String? selectedTopic;

  List<Map<String, String>> topics = [
    {"key": "users", "label": "254".tr},
    {"key": "delivary", "label": "255".tr},
  ];

  void setSelectedTopic(String val) {
    selectedTopic = val;
    update();
  }

  Future<void> sendNotification() async {
    if (title.text.isEmpty || message.text.isEmpty || selectedTopic == null) {
      Get.snackbar("63".tr, "252".tr);
      return;
    }
    statusRequest = StatusRequest.loading;
    update();

    var response = await notificationData.sendNotification(
      title: title.text,
      message: message.text,
      topic: selectedTopic ?? "",
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Get.snackbar("63".tr, "253".tr);
      title.clear();
      message.clear();
      selectedTopic = null;
    }

    update();
  }

  @override
  void onClose() {
    title.dispose();
    message.dispose();
    super.onClose();
  }
}
