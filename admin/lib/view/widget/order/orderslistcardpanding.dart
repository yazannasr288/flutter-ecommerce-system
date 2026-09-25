import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/pandingcontroller.dart';
import '../../../data/model/ordersmodel.dart';

class Cardorderslist extends GetView<Pandingcontroller> {
  final OrdersModel listdata;

  const Cardorderslist({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
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
                Text("144".tr, style: const TextStyle(fontSize: 18)),
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
            /*
            // محتوى معلق كما في الكود الأصلي
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
                if (listdata.ordersStatus == "0")
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.buttonordersdetailscolors,
                    ),
                    onPressed: () {
                      controller.approveorders(
                        listdata.ordersUsersid!,
                        listdata.ordersId!,
                      );
                      controller.refreshorder();
                    },
                    child: Text(
                      "219".tr,
                      style: const TextStyle(
                        color: Colors.red,
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
