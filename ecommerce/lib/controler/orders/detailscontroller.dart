import 'dart:async';

import 'package:ecommerse/data/datasource/remote/ordersdetailsdata.dart';
import 'package:ecommerse/data/model/cartmodel.dart';
import 'package:ecommerse/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/statusrequest.dart';
import '../handlingdatacontroller.dart';

class Ordersdetailscontroller extends GetxController {
  Ordersdetailsdata ordersdetailsdata = Ordersdetailsdata(Get.find());

  Completer<GoogleMapController>? completercontroller;
  CameraPosition? cameraPosition;

  List<Cartmodel> data = [];
  late StatusRequest statusRequest;
  List<Marker> markers = [];
  double? lat;
  double? long;
  late OrdersModel ordersModel;

  initialData() {
    if (ordersModel.ordersType == "0") {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!)),
        zoom: 12.4746,
      );
      markers.add(Marker(
          markerId: MarkerId("1"),
          position: LatLng(double.parse(ordersModel.addressLat!),
              double.parse(ordersModel.addressLong!))));
    }
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];

    initialData();
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await ordersdetailsdata.getData(ordersModel.ordersId!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => Cartmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
