import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerse/core/function/getdecodepolyline.dart';
import 'package:ecommerse/core/services/services.dart';
import 'package:ecommerse/data/model/ordersmodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/class/statusrequest.dart';

class Trackingcontroller extends GetxController {
  GoogleMapController? gms;
  Set<Polyline> polylineset = {};
  MyServices myServices = Get.find();
  List<Marker> markers = [];

  late StreamSubscription deliverySubscription;
  StreamSubscription<Position>? positionSubscription;

  CameraPosition? cameraPosition;
  late StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;

  double? dastlat;
  double? dastlang;
  double? currentlat;
  double? currentlang;

  getcurrentlocation() async {
    Position position = await Geolocator.getCurrentPosition();

    positionSubscription = Geolocator.getPositionStream().listen((Position position) {
      currentlat = position.latitude;
      currentlang = position.longitude;

      markers.removeWhere((m) => m.markerId.value == "current");
      markers.add(
        Marker(
          markerId: MarkerId("current"),
          position: LatLng(currentlat!, currentlang!),
        ),
      );

      update();
    });

    currentlat = position.latitude;
    currentlang = position.longitude;
    markers.removeWhere((m) => m.markerId.value == "current");
    markers.add(
      Marker(
        markerId: MarkerId("current"),
        position: LatLng(currentlat!, currentlang!),
      ),
    );
    update();
  }

  initialdata() {
    cameraPosition = CameraPosition(
      target: LatLng(
        double.parse(ordersModel.addressLat!),
        double.parse(ordersModel.addressLong!),
      ),
      zoom: 13,
    );

    markers.add(
      Marker(
        markerId: MarkerId("dast"),
        position: LatLng(
          double.parse(ordersModel.addressLat!),
          double.parse(ordersModel.addressLong!),
        ),
      ),
    );
  }

  initialpoltline() async {
    dastlat = double.parse(ordersModel.addressLat!);
    dastlang = double.parse(ordersModel.addressLong!);

    if (currentlat != null && currentlang != null) {
      polylineset = await getPolyline(currentlat, currentlang, dastlat, dastlang);
      update();
    }
  }

  getlocationdelivary() {
    deliverySubscription = FirebaseFirestore.instance
        .collection("delivary")
        .doc(ordersModel.ordersId)
        .snapshots()
        .listen((event) {
      if (event.exists) {
        dastlat = event.get("lat");
        dastlang = event.get("long");
        updatemarkerdelivary(dastlat!, dastlang!);
      }
    });
  }

  updatemarkerdelivary(double lat, double long) {
    markers.removeWhere((element) => element.markerId.value == "dast");
    markers.add(
      Marker(markerId: MarkerId("dast"), position: LatLng(lat, long)),
    );
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    initialdata();
    getlocationdelivary();
    getcurrentlocation().then((_) {
      initialpoltline();
    });
    super.onInit();
  }

  @override
  void onClose() {
    deliverySubscription.cancel();
    positionSubscription?.cancel();
    gms?.dispose();
    super.onClose();
  }
}
