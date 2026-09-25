import 'package:ecommerse/core/constant/routes.dart';
import 'package:ecommerse/view/widget/language/custombuttonlang.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../core/localisation/changelocal.dart';

class Changelang extends GetView<LocalController> {
  const Changelang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.headlineSmall),
            CustomButtonLang(
              textbutton: "ar",
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoutes.homepage);
              },
            ),
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
