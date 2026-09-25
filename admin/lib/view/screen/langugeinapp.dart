import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../core/constant/routes.dart';
import '../../core/localisation/changelocal.dart';
import '../widget/language/custombuttonlang.dart';

class Langugeinapp extends GetView<LocalController> {
  const Langugeinapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            CustomButtonLang(
              textbutton: "ar",
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoutes.homepage);
              },
            ),
            const SizedBox(height: 10),
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
