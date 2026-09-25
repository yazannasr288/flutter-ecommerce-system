import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../core/constant/routes.dart';
import '../../core/localisation/changelocal.dart';
import '../widget/language/custombuttonlang.dart';

class Changelang extends GetView<LocalController> {
  const Changelang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1'.tr),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "1".tr,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 30),
              CustomButtonLang(
                textbutton: "ar",
                onPressed: () {
                  controller.changeLang("ar");
                  Get.offAllNamed(AppRoutes.panding);
                },
              ),
              const SizedBox(height: 10),
              CustomButtonLang(
                textbutton: "en",
                onPressed: () {
                  controller.changeLang("en");
                  Get.offAllNamed(AppRoutes.panding);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
