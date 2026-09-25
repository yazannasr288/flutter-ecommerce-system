import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivary/controller/orders/acceptedcontroller.dart';
import 'package:delivary/core/constant/routes.dart';
import 'package:delivary/core/function/getdecodepolyline.dart';
import 'package:delivary/core/services/services.dart';
import 'package:delivary/data/model/ordersmodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/class/statusrequest.dart';

class Trackingcontroller extends GetxController {
  StreamSubscription<Position>? positionStream;
  GoogleMapController? gms;
  Set<Polyline> polylineset = {};
  final MyServices myServices = Get.find();
  List<Marker> markers = [];
  Timer? timer;
  final Acceptedcontroller acceptedcontroller = Get.find();
  CameraPosition? cameraPosition;
  StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;

  double? dastlat;
  double? dastlang;
  double? currentlat;
  double? currentlang;

  void getcurrentlocation() {
    cameraPosition = CameraPosition(
      target: LatLng(
        double.parse(ordersModel.addressLat!),
        double.parse(ordersModel.addressLong!),
      ),
      zoom: 12.4746,
    );

    markers.add(
      Marker(
        markerId: const MarkerId("dast"),
        position: LatLng(
          double.parse(ordersModel.addressLat!),
          double.parse(ordersModel.addressLong!),
        ),
      ),
    );

    positionStream = Geolocator.getPositionStream().listen((Position? position) {
      if (position == null) return;
      currentlat = position.latitude;
      currentlang = position.longitude;

      if (gms != null) {
        Future.delayed(const Duration(seconds: 1), () {
          gms?.animateCamera(
            CameraUpdate.newLatLng(LatLng(currentlat!, currentlang!)),
          );
        });
      }

      markers.removeWhere((marker) => marker.markerId.value == "current");
      markers.add(
        Marker(
          markerId: const MarkerId("current"),
          position: LatLng(currentlat!, currentlang!),
        ),
      );
      update();
    });
  }

  Future<void> donedelivary() async {
    statusRequest = StatusRequest.loading;
    update();
    await acceptedcontroller.donedelivary(ordersModel.ordersId!, ordersModel.ordersUsersid!);
    Get.offAllNamed(AppRoutes.homepage);
  }

  Future<void> initialpoltline() async {
    dastlat = double.parse(ordersModel.addressLat!);
    dastlang = double.parse(ordersModel.addressLong!);
    await Future.delayed(const Duration(seconds: 2));
    polylineset = await getPolyline(currentlat, currentlang, dastlat, dastlang);
    update();
  }

  void refreshlocation() async {
    await Future.delayed(const Duration(seconds: 2));
    timer = Timer.periodic(const Duration(seconds: 30), (_) {
      FirebaseFirestore.instance.collection("delivary").doc(ordersModel.ordersId).set({
        "lat": currentlat,
        "long": currentlang,
        "delivaryid": myServices.sharedPreferences.getString("id"),
      });
    });
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    getcurrentlocation();
    initialpoltline();
    refreshlocation();
    super.onInit();
  }

  @override
  void onClose() {
    timer?.cancel();
    positionStream?.cancel();
    gms?.dispose();
    super.onClose();
  }
}
