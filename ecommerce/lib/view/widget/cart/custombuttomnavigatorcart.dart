import 'package:ecommerse/controler/cartcontroller.dart';
import 'package:ecommerse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'buttononorder.dart';
import 'customcoponbutton.dart';

class Custombuttomnavigatorcart extends GetView<Cartcontroller> {
  final String price;
  final String discount;
  final String shipping;
  final String totalprice;
  final TextEditingController controllercopon;

  final void Function()? onapplycopon;

  const Custombuttomnavigatorcart({
    super.key,
    required this.price,
    required this.discount,
    required this.totalprice,
    required this.controllercopon,
    this.onapplycopon,
    required this.shipping,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom:
                  MediaQuery.of(context).viewInsets.bottom > 0
                      ? MediaQuery.of(context).viewInsets.bottom * 0.2
                      : 0,
            ),
            child: GetBuilder<Cartcontroller>(
              builder:
                  (contoller) =>
                      contoller.coponname == null
                          ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: controllercopon,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 10,
                                      ),
                                      hintText: "131".tr,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  flex: 1,
                                  child: Customcoponbutton(
                                    textbutton: "132".tr,
                                    onPressed: onapplycopon,
                                  ),
                                ),
                              ],
                            ),
                          )
                          : Container(
                            child: Row(
                              children: [
                                Text(
                                  "133".tr,
                                  style: TextStyle(color: AppColor.primaryColor),
                                ),Text(
                                  "${contoller.coponname!}",
                                  style: TextStyle(color: AppColor.primaryColor),
                                ),
                              ],
                            ),
                          ),
            ),
          ),
          SizedBox(height: 5),

          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),

                      child: Text("134".tr),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),

                      child: Text("$price\$"),
                    ),
                  ],
                ),
                Divider(thickness: 1),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),

                      child: Text("135".tr),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),

                      child: Text("$discount"),
                    ),
                  ],
                ),Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),

                      child: Text("136".tr),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),

                      child: Text("$shipping"),
                    ),
                  ],
                ),
                Divider(thickness: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),

                      child: Text(
                        "137".tr,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),

                      child: Text(
                        "$totalprice\$",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 20),
          CustomButtonCart(
            textbutton: "138".tr,
            onPressed: () {
              controller.goToPageCheckout();
            },
          ),
        ],
      ),
    );
  }
}
