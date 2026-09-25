import 'package:ecommerse/core/class/statusrequest.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';

import '../../core/constant/routes.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  Completer<GoogleMapController>? completercontroller;

  List<Marker> markers = [];
  double? lat;
  double? long;


  addmarkers(LatLng latlng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latlng));
    lat = latlng.latitude;
    long = latlng.longitude;
    update();
  }
  gotopageadddetailsaddress() {
    Get.toNamed(
      AppRoutes.addressAdddetails,
      arguments: {"lat": lat.toString(), "long": long.toString()},
    );
  }

  Position? position;

  CameraPosition? kGooglePlex;

  getcurrentlocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    addmarkers(LatLng(position!.latitude, position!.longitude),);
    statusRequest = StatusRequest.none;
    update();
  }



  @override
  void onInit() {
    getcurrentlocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
