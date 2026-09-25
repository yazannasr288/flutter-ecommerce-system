import 'package:ecommerse/core/constant/color.dart';
import 'package:ecommerse/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controler/orders/pandingcontroller.dart';
import '../../../data/model/ordersmodel.dart';

class Cardorderslist extends GetView<Pandingcontroller> {
  final OrdersModel listdata;

  const Cardorderslist({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  " ${listdata.ordersId}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Spacer(),
                Text(""
                    "144".tr, style: TextStyle(fontSize: 18)),
              ],
            ),Divider(),
            Row(
              children: [
                Text(
                  Jiffy.parse(
                    listdata.ordersDate!,
                    pattern: "yyyy-MM-dd",
                  ).fromNow(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                Text("145".tr, style: TextStyle(fontSize: 16)),
              ],
            ),
            Divider(),
            Row(
              children: [
                Text(
                  " ${controller.printtyprorder(listdata.ordersType!)}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Spacer(),
                Text("146".tr, style: TextStyle(fontSize: 16)),
              ],
            ),
            Divider(),

            Row(
              children: [
                Text(
                  " ${listdata.ordersPrice}\$",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Spacer(),
                Text("147".tr, style: TextStyle(fontSize: 16)),
              ],
            ),
            Divider(),

            Row(
              children: [
                Text(
                  "${listdata.ordersPricedilivery}\$",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text("148".tr, style: TextStyle(fontSize: 16)),
              ],
            ),
            Divider(),

            Row(
              children: [
                Text(
                  "${controller.printpamentmetodeorder(listdata.ordersPaymethod!)}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Spacer(),
                Text(
                  "149".tr,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Divider(),

            Row(
              children: [
                Text(
                  "${controller.printorderstatus(listdata.ordersStatus!)}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Spacer(),
                Text("150".tr, style: TextStyle(fontSize: 16)),
              ],
            ),
            Divider(),
            Row(
              children: [
                Text(
                  "${listdata.ordersTotalprice}\$",

                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),Spacer(),
                Text(
                  "151".tr,

                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),Divider(),
            Row(children: [ ElevatedButton(
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
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),Spacer(),

              if (listdata.ordersStatus == "0")
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.buttonordersdetailscolors,
                  ),
                  onPressed: () {
                    controller.deleteorders(listdata.ordersId!);
                  },
                  child: Text(
                    "153".tr,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),],)
          ],
        ),
      ),
    );
  }
}
