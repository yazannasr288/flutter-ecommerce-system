import 'package:ecommerse/controler/notificationcontroller.dart';
import 'package:ecommerse/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(title: Text("122".tr)),
      body: GetBuilder<NotificationController>(
        builder:
            (controller) =>
            Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: Container(
                child: ListView(
                  children: [
                    ...List.generate(
                      controller.data.length,
                          (index) =>
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              title: Text(
                                  controller.data[index]['notification_title'],
                                  style: TextStyle(fontSize: 18,
                                      fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  controller.data[index]['notification_body'],
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                              ),
                              trailing: Text(
                                Jiffy.parse(
                                  controller.data[index]['notification_date'],

                                  pattern: "yyyy-MM-dd",
                                ).fromNow(), style: TextStyle(
                                  fontSize: 20, color: Colors.redAccent),
                              ),
                            ),
                          ),
                    )
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
