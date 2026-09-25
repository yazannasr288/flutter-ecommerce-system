import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/notificationcontroller.dart';
import '../../core/class/handlingdataview.dart';

class Notification extends StatelessWidget {
  Notification({Key? key}) : super(key: key);

  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("247".tr)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<NotificationController>(
          builder: (controller) {
            return Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  TextField(
                    controller: controller.title,
                    decoration: InputDecoration(labelText: "248".tr),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: controller.message,
                    decoration: InputDecoration(labelText: "249".tr),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: "250".tr),
                    value: controller.selectedTopic,
                    items: controller.topics
                        .map(
                          (topic) => DropdownMenuItem<String>(
                        value: topic["key"],
                        child: Text(topic["label"]!),
                      ),
                    )
                        .toList(),
                    onChanged: (val) {
                      if (val != null) controller.setSelectedTopic(val);
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      controller.sendNotification();
                    },
                    child: Text("251".tr),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
