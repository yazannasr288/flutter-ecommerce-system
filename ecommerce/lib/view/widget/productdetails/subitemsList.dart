import 'package:ecommerse/controler/productdetailscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class Subitemslist extends GetView<ProductdetailscontrollerImp> {
  const Subitemslist({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subtitles.length,
          (index) => Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 5),
            height: 60,
            width: 90,
            decoration: BoxDecoration(
              color:
                  controller.subtitles[index]['active'] == "1"
                      ? Colors.red
                      : AppColor.white,
              border: Border.all(color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              controller.subtitles[index]['name'],
              style: TextStyle(
                color:
                    (controller.subtitles[index]['active'] == "1"
                        ? Colors.white
                        : AppColor.primaryColor),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
