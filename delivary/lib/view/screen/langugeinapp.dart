import 'package:delivary/core/constant/routes.dart';
import 'package:delivary/view/widget/language/custombuttonlang.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../core/localisation/changelocal.dart';

class Langugeinapp extends GetView<LocalController> {
  const Langugeinapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                Get.toNamed(AppRoutes.homepage);
              },
            ),
            const SizedBox(height: 15),
            CustomButtonLang(
              textbutton: "en",
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRoutes.homepage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
