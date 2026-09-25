import 'package:ecommerse/controler/cartcontroller.dart';
import 'package:ecommerse/core/class/handlingdataview.dart';
import 'package:ecommerse/core/constant/color.dart';
import 'package:ecommerse/view/widget/cart/customitemcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/cart/custombuttomnavigatorcart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Cartcontroller cartcontroller = Get.put(Cartcontroller());
    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        title: Text("111".tr),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[50],
      ),
      bottomNavigationBar: GetBuilder<Cartcontroller>(
        builder:
            (controller) => Custombuttomnavigatorcart(
              shipping: "10",
              controllercopon: controller.controllercopon!,
              onapplycopon: () {
                controller.checkcopon();
              },

              price: "${cartcontroller.priceorders.toStringAsFixed(2)}",
              discount: "${controller.discountcopon}%",
              totalprice: "${controller.gettotalprice().toStringAsFixed(2)}",
            ),
      ),
      body: GetBuilder<Cartcontroller>(
        builder:
            ((controller) => Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("112".tr,style: TextStyle(fontSize: 18,letterSpacing: 1.2,fontWeight: FontWeight.bold),),
                        Text("${cartcontroller.totalcountitems}",style: TextStyle(fontSize: 18,letterSpacing: 1.2,fontWeight: FontWeight.bold),),
                        Text("113".tr,style: TextStyle(fontSize: 18,letterSpacing: 1.2,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Column(
                      children: [
                        ...List.generate(
                          cartcontroller.data.length,
                          (index) => Customitemcard(
                            onadd: () async {
                              await cartcontroller.add(
                                cartcontroller.data[index].itemsId!.toString(),
                              );
                              cartcontroller.refrshpage();
                            },
                            onremove: () async {
                              await cartcontroller.delete(
                                cartcontroller.data[index].itemsId!.toString(),
                              );
                              cartcontroller.refrshpage();
                            },
                            name: "${cartcontroller.data[index].itemsName}",
                            imagename:
                                "${cartcontroller.data[index].itemsImage}",
                            price:
                                ((cartcontroller.data[index].itemsDiscount ??
                                            0) >
                                        0)
                                    ? "${double.tryParse(cartcontroller.data[index].itemspricediscount.toString())?.toStringAsFixed(2) ?? '0.00'}\$"
                                    : "${double.tryParse(cartcontroller.data[index].itemsPrice.toString())?.toStringAsFixed(2) ?? '0.00'}\$",

                            count: "${cartcontroller.data[index].countitems}",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
