import 'package:ecommerse/core/class/handlingdataview.dart';
import 'package:ecommerse/core/constant/color.dart';
import 'package:ecommerse/core/function/translatedatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controler/orders/detailscontroller.dart';

class Ordersdetails extends StatelessWidget {
  const Ordersdetails({super.key});

  @override
  Widget build(BuildContext context) {
    Ordersdetailscontroller controller = Get.put(Ordersdetailscontroller());
    return Scaffold(
      appBar: AppBar(title: Text('104'.tr)),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<Ordersdetailscontroller>(
          builder:
              ((controller) => Handlingdataview(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Table(
                                children: [
                                  TableRow(
                                    children: [
                                      Text(
                                        "105".tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "106".tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "107".tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ...List.generate(
                                    controller.data.length,
                                    (index) => TableRow(
                                      children: [
                                        Text(
                                          translateDatabase(
                                            "${controller.data[index].itemsNameAr}",
                                            "${controller.data[index].itemsName}",
                                          ),style: TextStyle(fontSize: 18),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "${controller.data[index].countitems}",
                                          textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 18),),
                                        Text(
                                          "${controller.data[index].itemsPrice}",
                                          textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 18),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "108".tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),SizedBox(width: 2,),
                                  Text(
                                    "${controller.ordersModel.ordersTotalprice}\$",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),SizedBox(height: 10,),
                    if (controller.ordersModel.ordersType == "0")
                      Container(
                        height: 70,
                        child: Card(
                          child: Column(
                            children: [
                              SizedBox(height: 2),

                              Text(
                                "109".tr,
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),SizedBox(height: 10,),
                    if (controller.ordersModel.ordersType == "0")
                      Card(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          height: 300,
                          width: double.infinity,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            markers: controller.markers.toSet(),
                            initialCameraPosition: controller.cameraPosition!,
                            onMapCreated: (GoogleMapController controllermap) {
                              controller.completercontroller!.complete(
                                controllermap,
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
