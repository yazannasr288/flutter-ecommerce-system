import 'package:ecommerse/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controler/trackingcontroller.dart';

class Tracking extends StatelessWidget {
  const Tracking({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Trackingcontroller());

    return Scaffold(
      appBar: AppBar(title: Text("182".tr)),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GetBuilder<Trackingcontroller>(
          builder: (ctrl) => Handlingdataview(
            statusRequest: ctrl.statusRequest,
            widget: GoogleMap(
              polylines: ctrl.polylineset,
              mapType: MapType.normal,
              markers: ctrl.markers.toSet(),
              initialCameraPosition: ctrl.cameraPosition ??
                  const CameraPosition(target: LatLng(0, 0), zoom: 1),
              onMapCreated: (GoogleMapController mapController) {
                ctrl.gms = mapController;
              },
            ),
          ),
        ),
      ),
    );
  }
}
