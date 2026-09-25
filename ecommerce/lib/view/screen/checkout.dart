import 'package:ecommerse/controler/checkoutcontroller.dart';
import 'package:ecommerse/core/class/handlingdataview.dart';
import 'package:ecommerse/core/constant/color.dart';
import 'package:ecommerse/core/constant/imageassete.dart';
import 'package:ecommerse/view/widget/checkout/cardaddresscheckout.dart';
import 'package:ecommerse/view/widget/checkout/carddelivarttype.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/checkout/cardpaymentmethod.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    Checkoutcontroller controller = Get.put(Checkoutcontroller());

    return Scaffold(
      appBar: AppBar(title: Text("114".tr)),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(color: AppColor.primaryColor),
            backgroundColor: AppColor.primaryColor,
          ),
          onPressed: () {
            controller.checkout();
          },
          child: Text(
            "114".tr,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColor.white,
            ),
          ),
        ),
      ),
      body: GetBuilder<Checkoutcontroller>(
        builder:
            (controller) => Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.all(20),
                child: ListView(
                  children: [

                    Text(
                      "115".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        controller.choosepaymentmethor("0");
                      },
                      child: Cardpaymentmethod(
                        title: "116".tr,

                        isactive:
                            controller.paymethod == "0" ? true : false,
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        controller.choosepaymentmethor("1");
                      },
                      child: Cardpaymentmethod(
                        title: '117'.tr,
                        isactive:
                            controller.paymethod == "1" ? true : false,
                      ),
                    ),

                    SizedBox(height: 20),
                    Text(
                      "118".tr,
                      style: TextStyle(
                        color: AppColor.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.choosedelivarytype("0");
                          },
                          child: Carddelivarttype(
                            imagename: AppImageAssets.dilivaryman,
                            title: "119".tr,
                            isactiv:
                                controller.delivarytype == "0"
                                    ? true
                                    : false,
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            controller.choosedelivarytype("1");
                          },
                          child: Carddelivarttype(
                            imagename: AppImageAssets.drivethru,
                            title: "120".tr,
                            isactiv:
                                controller.delivarytype == "1"
                                    ? true
                                    : false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    if (controller.delivarytype == "0")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.dataaddress.isNotEmpty)
                            Text(
                            "109".tr,
                            style: TextStyle(
                              color: AppColor.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          if(controller.dataaddress.isEmpty)

                          SizedBox(height: 20),
                          ...List.generate(
                            controller.dataaddress.length,
                            (index) => InkWell(
                              onTap: () {
                                controller.chooseshippingaddress(
                                  controller.dataaddress[index].addressId!,
                                );
                              },
                              child: Cardaddresscheckout(
                                title:
                                    "${controller.dataaddress[index].addressName}",
                                isactive:
                                    controller.addressid ==
                                            controller
                                                .dataaddress[index]
                                                .addressId
                                        ? true
                                        : false,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
