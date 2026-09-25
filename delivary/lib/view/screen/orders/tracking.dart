import 'package:delivary/controller/trackingcontroller.dart';
import 'package:delivary/core/class/handlingdataview.dart';
import 'package:delivary/core/constant/color.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Tracking extends StatelessWidget {
  const Tracking({super.key});

  @override
  Widget build(BuildContext context) {
    Trackingcontroller controller = Get.put(Trackingcontroller());
    return Scaffold(
      appBar: AppBar(title: Text("186".tr)),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: GetBuilder<Trackingcontroller>(
          builder: (controller) => Handlingdataview(
            statusRequest: controller.statusRequest,
            widget: Stack(
              children: [
                GoogleMap(
                  polylines: controller.polylineset,
                  mapType: MapType.normal,
                  markers: controller.markers.toSet(),
                  initialCameraPosition: controller.cameraPosition!,
                  onMapCreated: (GoogleMapController controllermap) {
                    controller.gms = controllermap;
                  },
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed: () {
                      controller.donedelivary();
                    },
                    child: Text(
                      "188".tr,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
