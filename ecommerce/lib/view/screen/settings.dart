import 'package:ecommerse/core/constant/color.dart';
import 'package:ecommerse/core/constant/imageassete.dart';
import 'package:ecommerse/core/constant/routes.dart';
import 'package:ecommerse/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controler/settingscontroller.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    Settingscontroller controller = Get.put(Settingscontroller());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(height: Get.width / 3, color: AppColor.primaryColor),
              Positioned(
                top: Get.width / 3.9,

                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColor.grey,
                    backgroundImage: AssetImage(AppImageAssets.avatar),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 70),
          Center(
            child: Text(
              "${myServices.sharedPreferences.getString("email")}",
            ),
          ),

          SizedBox(height: 20),

          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text("123".tr),
                      // onTap: () {},
                      trailing: controller.notificationSwitch(),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("124".tr),
                      onTap: () {
                        Get.toNamed(AppRoutes.addressview);
                      },
                      trailing: Icon(Icons.location_on_outlined),
                    ),
                    Divider(),

                    ListTile(
                      title: Text("125".tr),
                      onTap: () {
                        Get.toNamed(AppRoutes.panding);
                      },
                      trailing: Icon(Icons.delivery_dining_outlined),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("126".tr),
                      onTap: () {
                        Get.toNamed(AppRoutes.archive);
                      },
                      trailing: Icon(Icons.archive_outlined),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("165".tr),
                      onTap: () {
                        Get.toNamed(AppRoutes.changlang);
                      },
                      trailing: Icon(Icons.language_outlined),
                    ),
                    Divider(),

                    ListTile(
                      title: Text("127".tr),
                      onTap: () {Get.toNamed(AppRoutes.aboutus);},
                      trailing: Icon(Icons.help_center_outlined),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("128".tr),
                      onTap: () {
                        controller.openWhatsApp(
                          phone: "9630947136050",
                          message: "129".tr,
                        );
                      },
                      trailing: Icon(Icons.phone_callback_outlined),
                    ),
                    Divider(),

                    ListTile(
                      title: Text("130".tr),
                      onTap: () {
                        controller.logut();
                      },
                      trailing: Icon(Icons.logout_outlined),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
