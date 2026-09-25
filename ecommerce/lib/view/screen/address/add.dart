import 'package:ecommerse/core/class/handlingdataview.dart';
import 'package:ecommerse/core/constant/color.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controler/address/addcontroller.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
  Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(title: Text("88".tr)),

      body: Container(
        child: GetBuilder<AddAddressController>(
          builder:
              (controllerpage) => Handlingdataview(
                statusRequest: controllerpage.statusRequest,
                widget: Column(
                  children: [
                    if (controllerpage.kGooglePlex != null)
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            GoogleMap(
                              mapType: MapType.normal,
                              markers: controllerpage.markers.toSet(),
                              onTap: (latlong) {
                                controllerpage.addmarkers(latlong);
                              },
                              initialCameraPosition:
                                  controllerpage.kGooglePlex!,
                              onMapCreated: (
                                GoogleMapController controllermap,
                              ) {
                                controllerpage.completercontroller!.complete(
                                  controllermap,
                                );
                              },
                            ),

                            Positioned(
                              bottom: 30,
                              child: Container(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    backgroundColor: AppColor.primaryColor,
                                  ),
                                  onPressed: () {
                                  controllerpage.gotopageadddetailsaddress();
                                  },
                                  child: Text(
                                    "89".tr,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.black,
                                    ),
                                  ),
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
      ),
    );
  }
}
