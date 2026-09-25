import 'package:ecommerse/controler/address/adddetailscontroller.dart';
import 'package:ecommerse/core/class/handlingdataview.dart';
import 'package:ecommerse/view/widget/auth/custom_text_form_auth.dart%20.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/shared/custombutton.dart';


class AddressAdddetails extends StatelessWidget {
  const AddressAdddetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      AddAddressdtailsController(),
    );
    return Scaffold(
      appBar: AppBar(title: Text("90".tr)),

      body: Container(
        padding: EdgeInsets.all(20),
        child: GetBuilder<AddAddressdtailsController>(
          builder:
              (controller) => Handlingdataview(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [

                    Customtextformauth(
                      hinttext: "91".tr,
                      labletext: "91".tr,
                      iconData: Icons.near_me,
                      mycontroller: controller.name,
                      valid: (val) {return;},
                      isnumber: false,
                    ),
                    Customtextformauth(
                      hinttext: "92".tr,
                      labletext: "92".tr,
                      iconData: Icons.location_city,
                      mycontroller: controller.city,
                      valid: (val) {return;},
                      isnumber: false,
                    ),
                    Customtextformauth(
                      hinttext: "93".tr,
                      labletext: "93".tr,
                      iconData: Icons.streetview,
                      mycontroller: controller.street,
                      valid: (val) {return;},
                      isnumber: false,
                    ),Customtextformauth(
                      hinttext: "94".tr,
                      labletext: "94".tr,
                      iconData: Icons.note,
                      mycontroller: controller.note,
                      valid: (val) {return;},
                      isnumber: false,
                    ),
                    if (controller.isEdit)
                      Container(
                        height: 300,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                double.parse(controller.lat!),
                                double.parse(controller.long!),
                              ),
                              zoom: 14.0,
                            ),
                            markers: {
                              Marker(
                                markerId: MarkerId("edit"),
                                position: LatLng(
                                  double.parse(controller.lat!),
                                  double.parse(controller.long!),
                                ),
                              ),
                            },
                            zoomGesturesEnabled: true,
                            scrollGesturesEnabled: true,
                            rotateGesturesEnabled: true,
                            tiltGesturesEnabled: true,
                            myLocationEnabled: true,
                            onTap: (LatLng pos) {
                              controller.lat = pos.latitude.toString();
                              controller.long = pos.longitude.toString();
                              controller.update();
                            },
                            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                              Factory<OneSequenceGestureRecognizer>(
                                    () => EagerGestureRecognizer(),
                              ),
                            },
                          ),
                        ),
                      ),

                    Custombutton(
                      text: controller.isEdit ? "95".tr : "96".tr,
                      onPressed: () {
                        controller.isEdit ? controller.editAddress() : controller.addAddress();
                      },
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
