import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/function/translatedatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/orders/detailscontroller.dart';

class Ordersdetails extends StatelessWidget {
  const Ordersdetails({super.key});

  @override
  Widget build(BuildContext context) {
    Ordersdetailscontroller controller = Get.put(Ordersdetailscontroller());
    return Scaffold(
      appBar: AppBar(title: Text('104'.tr)),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<Ordersdetailscontroller>(
          builder: (controller) => Handlingdataview(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: _TableHeaders(),
                        ),
                        const Divider(),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "108".tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 2),
                              Text(
                                "${controller.ordersModel.ordersTotalprice}\$",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
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
                const SizedBox(height: 10),
                if (controller.ordersModel.ordersType == "0")
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "109".tr,
                            style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Divider(thickness: 3),
                          _AddressRow(
                            label: "222".tr,
                            value: controller.ordersModel.addressName,
                          ),
                          const Divider(thickness: 3),
                          _AddressRow(
                            label: "223".tr,
                            value: controller.ordersModel.addressCity,
                          ),
                          const Divider(thickness: 3),
                          _AddressRow(
                            label: "224".tr,
                            value: controller.ordersModel.addressStreet,
                          ),
                          const Divider(thickness: 3),
                          _AddressRow(
                            label: "225".tr,
                            value: controller.ordersModel.addressnote,
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 10),
                if (controller.ordersModel.ordersType == "0")
                  Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
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
                          controller.completercontroller.complete(controllermap);
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TableHeaders extends StatelessWidget {
  const _TableHeaders();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Ordersdetailscontroller>();
    return Table(
      children: [
        TableRow(
          children: [
            Text("311".tr, textAlign: TextAlign.center, style: _headerStyle),
            Text("105".tr, textAlign: TextAlign.center, style: _headerStyle),
            Text("106".tr, textAlign: TextAlign.center, style: _headerStyle),
            Text("107".tr, textAlign: TextAlign.center, style: _headerStyle),
            Text("310".tr, textAlign: TextAlign.center, style: _headerStyle),
          ],
        ),
        ...List.generate(
          controller.data.length,
              (index) => TableRow(
            children: [
              Text(
                "${controller.data[index].itemsId}",
                style: _cellStyle,
                textAlign: TextAlign.center,
              ),
              Text(
                translateDatabase(
                  controller.data[index].itemsNameAr,
                  controller.data[index].itemsName,
                ),
                style: _cellStyle,
                textAlign: TextAlign.center,
              ),
              Text(
                "${controller.data[index].countitems}",
                textAlign: TextAlign.center,
                style: _cellStyle,
              ),
              Text(
                "${controller.data[index].itemspricediscount}",
                textAlign: TextAlign.center,
                style: _cellStyle,
              ),
              Text(
                controller.translateColor("${controller.data[index].colors}"),
                textAlign: TextAlign.center,
                style: _cellStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  static const TextStyle _headerStyle = TextStyle(
    color: AppColor.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const TextStyle _cellStyle = TextStyle(fontSize: 18);
}

class _AddressRow extends StatelessWidget {
  final String label;
  final String? value; // ✅ لتفادي الخطأ String? can't be assigned to String

  const _AddressRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(label),
          const Spacer(),
          Expanded(
            flex: 4,
            child: Text(
              value ?? "", // ✅ عرض قيمة فارغة إذا كانت null
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
