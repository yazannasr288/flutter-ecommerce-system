import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/aboutus/customaboutusname.dart';
import '../widget/aboutus/customaboutustext.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("167".tr)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Customaboutustext(
              maintext: "168".tr,
              subtext: "169".tr,
            ),
            Customaboutusname(maintext: "170".tr),
            Customaboutusname(maintext: "171".tr),
            Customaboutustext(
              maintext: "172".tr,
              subtext:
                  "173".tr,
            ),
            Customaboutustext(
              maintext: "174".tr,
              subtext:
                  "175".tr,
            ),
            Customaboutustext(
              maintext: "176".tr,
              subtext:
                  "177".tr,
            ),
            Customaboutustext(
              maintext: "178".tr,
              subtext:
                  "179".tr,
            ),
            Customaboutustext(
              maintext: "180".tr,
              subtext:
                  "181".tr,
            ),
          ],
        ),
      ),
    );
  }
}
