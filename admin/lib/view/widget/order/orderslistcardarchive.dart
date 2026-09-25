import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/archivecontroller.dart';
import '../../../data/model/ordersmodel.dart';

class Cardorderslistarchive extends GetView<Archivecontroller> {
  final OrdersModel listdata;

  const Cardorderslistarchive({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    // ثوابت لأنماط النصوص لتقليل إعادة بناء الكائنات
    const TextStyle labelStyle = TextStyle(fontSize: 16);
    const TextStyle valueStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );
    const TextStyle totalStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );

    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("144".tr, style: labelStyle),
                const Spacer(),
                Text(
                  " ${listdata.ordersId}",
                  style: valueStyle,
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Text("145".tr, style: labelStyle),
                const Spacer(),
                Text(
                  Jiffy.parse(
                    listdata.ordersDate!,
                    pattern: "yyyy-MM-dd",
                  ).fromNow(),
                  style: valueStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Text("266".tr, style: labelStyle),
                const Spacer(),
                InkWell(
                  onTap: () => controller.callNumber(listdata.userphone!),
                  child: Text(
                    " ${listdata.userphone}",
                    style: valueStyle,
                  ),
                ),
              ],
            ),
            if (listdata.ordersType == "0") ...[
              const Divider(),
              Row(
                children: [
                  Text("267".tr, style: labelStyle),
                  const Spacer(),
                  InkWell(
                    onTap: () => controller.callNumber(listdata.delivaryphone!),
                    child: Text(
                      " ${listdata.delivaryphone}",
                      style: valueStyle,
                    ),
                  ),
                ],
              ),
            ],
            const Divider(),
            Row(
              children: [
                Text("146".tr, style: labelStyle),
                const Spacer(),
                Text(
                  " ${controller.printtyprorder(listdata.ordersType!)}",
                  style: valueStyle,
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Text("147".tr, style: labelStyle),
                const Spacer(),
                Text(
                  " ${listdata.ordersPrice}\$",
                  style: valueStyle,
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Text("148".tr, style: labelStyle),
                const Spacer(),
                Text(
                  "${listdata.ordersPricedilivery}\$",
                  style: valueStyle,
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Text("149".tr, style: labelStyle),
                const Spacer(),
                Text(
                  "${controller.printpamentmetodeorder(listdata.ordersPaymethod!)}",
                  style: valueStyle,
                ),
              ],
            ),
            const Divider(),
            // تعليق الكود السابق كما هو
            /*
            Row(
              children: [
                Text(
                  "${controller.printorderstatus(listdata.ordersStatus!)}",
                  style: valueStyle,
                ),
                Spacer(),
                Text("150".tr, style: labelStyle),
              ],
            ),
            Divider(),
            */
            Row(
              children: [
                Text("151".tr, style: const TextStyle(fontSize: 18)),
                const Spacer(),
                Text(
                  "${listdata.ordersTotalprice}\$",
                  style: totalStyle,
                ),
              ],
            ),
            if (listdata.ordersType == "0") ...[
              const Divider(),
              Row(
                children: [
                  Text("رقم الدلفري".tr, style: const TextStyle(fontSize: 18)),
                  const Spacer(),
                  Text(
                    "${listdata.orderdellivaryid}",
                    style: totalStyle,
                  ),
                ],
              ),
            ],
            const Divider(),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.buttonordersdetailscolors,
                  ),
                  onPressed: () {
                    Get.toNamed(
                      AppRoutes.ordersdetails,
                      arguments: {"ordersmodel": listdata},
                    );
                  },
                  child: Text(
                    "152".tr,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                if (listdata.ordersRating != "0")
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.buttonordersdetailscolors,
                    ),
                    onPressed: () {
                      Get.toNamed(
                        AppRoutes.ordersrating,
                        arguments: {"ordersmodel": listdata},
                      );
                    },
                    child: Text(
                      "التقييم".tr,
                      style: TextStyle(
                        color: Colors.yellow[800],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
