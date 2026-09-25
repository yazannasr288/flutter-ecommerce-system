import 'package:delivary/core/constant/color.dart';
import 'package:delivary/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/archivecontroller.dart';
import '../../../data/model/ordersmodel.dart';

class Cardorderslistarchive extends GetView<Archivecontroller> {
  final OrdersModel listdata;

  const Cardorderslistarchive({super.key, required this.listdata});

  TextStyle get _labelStyle => const TextStyle(fontSize: 16);
  TextStyle get _valueStyle => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.green,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow("144".tr, " ${listdata.ordersId}", _valueStyle),
            const Divider(),
            _buildRow(
              "145".tr,
              Jiffy.parse(listdata.ordersDate!, pattern: "yyyy-MM-dd").fromNow(),
              _valueStyle,
              textAlign: TextAlign.center,
            ),
            const Divider(),
            _buildRow(
              "146".tr,
              " ${controller.printtyprorder(listdata.ordersType!)}",
              _valueStyle,
            ),
            const Divider(),
            _buildRow("147".tr, " ${listdata.ordersPrice}\$", _valueStyle),
            const Divider(),
            _buildRow(
              "195".tr,
              " ${listdata.userphone}",
              _valueStyle.copyWith(
                decoration: TextDecoration.underline,
                color: Colors.green.shade700,
              ),
              onTap: () => controller.callNumber(listdata.userphone!),
            ),
            const Divider(),
            _buildRow("148".tr, "${listdata.ordersPricedilivery}\$", _valueStyle),
            const Divider(),
            _buildRow(
              "149".tr,
              "${controller.printpamentmetodeorder(listdata.ordersPaymethod!)}",
              _valueStyle,
            ),
            const Divider(),
            _buildRow(
              "150".tr,
              "${controller.printorderstatus(listdata.ordersStatus!)}",
              _valueStyle,
            ),
            const Divider(),
            _buildRow(
              "151".tr,
              "${listdata.ordersTotalprice}\$",
              _valueStyle.copyWith(fontSize: 20),
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
                // إذا أردت تفعيل زر التقييم لاحقاً:
                // if (listdata.ordersRating == "0")
                //   ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: AppColor.buttonordersdetailscolors,
                //     ),
                //     onPressed: () {},
                //     child: Text(
                //       "154".tr,
                //       style: TextStyle(
                //         color: Colors.yellow[800],
                //         fontSize: 16,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(
      String label,
      String value,
      TextStyle valueStyle, {
        TextAlign? textAlign,
        void Function()? onTap,
      }) {
    final valueWidget = onTap != null
        ? InkWell(
      onTap: onTap,
      child: Text(
        value,
        style: valueStyle,
        textAlign: textAlign,
      ),
    )
        : Text(
      value,
      style: valueStyle,
      textAlign: textAlign,
    );

    return Row(
      children: [
        Text(label, style: _labelStyle),
        const Spacer(),
        valueWidget,
      ],
    );
  }
}
