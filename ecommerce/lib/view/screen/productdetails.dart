import 'package:ecommerse/controler/productdetailscontroller.dart';
import 'package:ecommerse/core/class/handlingdataview.dart';
import 'package:ecommerse/core/constant/color.dart';
import 'package:ecommerse/core/constant/routes.dart';
import 'package:ecommerse/core/function/translatedatabase.dart';
import 'package:ecommerse/view/widget/productdetails/priceandcount.dart';
import 'package:ecommerse/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/imageassete.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductdetailscontrollerImp controller = Get.put(
      ProductdetailscontrollerImp(),
    );
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: 43,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200),
          ),
          color: AppColor.primaryColor,
          onPressed: () {
            Get.toNamed(AppRoutes.cart);
          },
          child: Text(
            "61".tr,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<ProductdetailscontrollerImp>(
        builder:
            (controller) => Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Toppageproductdetails(),
                  SizedBox(height: 100),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${translateDatabase(controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName)}",
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall!.copyWith(
                            color: Colors.purple[900],
                            fontSize: 40,
                          ),
                        ),SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.time_to_leave_outlined, size: 30),
                            SizedBox(width: 4),
                            Text(
                              "${controller.delivarytime}",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              "-${controller.delivarytimeextra} ",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text("139".tr, style: TextStyle(fontSize: 18)),
                            Spacer(),
                            Row(
                              children: [
                                if (controller.itemsModel.itemsDiscount != "0")
                                  Image.asset(AppImageAssets.sale, width: 50),
                                if (controller.itemsModel.itemsDiscount != "0")
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 2,
                                    ),

                                    child: Text(
                                      "%${controller.itemsModel.itemsDiscount}",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 25),

                        Text(
                          "${translateDatabase(controller.itemsModel.itemsDescAr, controller.itemsModel.itemsDesc)}",
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium!.copyWith(
                            color: AppColor.primaryColor,
                            fontSize: 22,letterSpacing: 1.5
                          ),
                        ),
                        SizedBox(height: 20),

                        // Priceandcount(
                        //   onAdd: () {
                        //     controller.add();
                        //   },
                        //   onRemove: () {
                        //     controller.remove();
                        //   },
                        //   price: "${controller.itemsModel.itemspricediscount}",
                        //
                        //   count: "${controller.countitems}",
                        // ),
                        Priceandcount(
                          onAdd: () {
                            controller.add();
                          },
                          onRemove: () {
                            controller.remove();
                          },
                          price:
                              (int.tryParse(
                                            controller.itemsModel.itemsDiscount
                                                .toString(),
                                          ) ??
                                          0) >
                                      0
                                  ? Column(
                                    children: [
                                      Text(
                                        "\$ ${controller.itemsModel.itemsPrice}",
                                        style: TextStyle(
                                          color: Colors.red,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "\$ ${controller.itemsModel.itemspricediscount}",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ],
                                  )
                                  : Text(
                                    "\$ ${controller.itemsModel.itemsPrice}",
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                          count: "${controller.countitems}",
                        ),

                        // SizedBox(height: 20),
                        // Text(
                        //   "60".tr,
                        //   style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        //     color: AppColor.primaryColor,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // SizedBox(height: 25),
                        // Subitemslist(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
