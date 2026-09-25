import 'package:delivary/core/class/handlingdataview.dart';
import 'package:delivary/core/constant/color.dart';
import 'package:delivary/core/constant/routes.dart';
import 'package:delivary/core/function/translatedatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/orders/detailscontroller.dart';

class Ordersdetails extends StatelessWidget {
  const Ordersdetails({super.key});

  static const EdgeInsets pagePadding = EdgeInsets.symmetric(horizontal: 10, vertical: 10);
  static const EdgeInsets sectionPadding = EdgeInsets.symmetric(vertical: 10, horizontal: 10);

  @override
  Widget build(BuildContext context) {
    Ordersdetailscontroller controller = Get.put(Ordersdetailscontroller());

    return Scaffold(
      appBar: AppBar(title: Text('104'.tr)),

      body: Container(
        padding: pagePadding,
        child: GetBuilder<Ordersdetailscontroller>(
          builder: (controller) => Handlingdataview(
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
                                    "311".tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
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
                                  Text(
                                    "197".tr,
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
                                      "${controller.data[index].itemsId}",
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      translateDatabase(
                                        "${controller.data[index].itemsNameAr}",
                                        "${controller.data[index].itemsName}",
                                      ),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "${controller.data[index].countitems}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "${controller.data[index].itemspricediscount}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      controller.translateColor("${controller.data[index].cartcolors}"),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        SizedBox(height: 10),
                        Container(
                          padding: sectionPadding,
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
                              ),
                              SizedBox(width: 5),
                              Text(
                                "${controller.ordersModel.ordersTotalprice}\$",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.green,
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
                ),
                SizedBox(height: 20),

                if (controller.ordersModel.ordersType == "0")
                  Card(
                    child: Padding(
                      padding: sectionPadding,
                      child: Column(
                        children: [
                          Text(
                            "109".tr,
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          Divider(thickness: 3),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Text("191".tr),
                                Spacer(),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "${controller.ordersModel.addressName}",
                                    textAlign: TextAlign.end,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 3),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Text("192".tr),
                                Spacer(),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "${controller.ordersModel.addressCity}",
                                    textAlign: TextAlign.end,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 3),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Text("193".tr),
                                Spacer(),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "${controller.ordersModel.addressStreet}",
                                    textAlign: TextAlign.end,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 3),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Text("194".tr),
                                Spacer(),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "${controller.ordersModel.addressnote}",
                                    textAlign: TextAlign.end,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                SizedBox(height: 10),

                if (controller.ordersModel.ordersType == "0")
                  Card(
                    child: Container(
                      padding: sectionPadding,
                      height: 300,
                      width: double.infinity,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        markers: controller.markers.toSet(),
                        initialCameraPosition: controller.cameraPosition!,
                        onMapCreated: (GoogleMapController controllermap) {
                          controller.completercontroller.complete(controllermap);
                        },
                      ),
                    ),
                  ),

                SizedBox(height: 10),

                if (controller.ordersModel.ordersType == "0" &&
                    controller.ordersModel.ordersStatus == "3")
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(
                        AppRoutes.tracking,
                        arguments: {"ordersmodel": controller.ordersModel},
                      );
                    },
                    child: Text("186".tr),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
