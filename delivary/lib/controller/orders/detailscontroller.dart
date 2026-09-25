import 'dart:async';

import 'package:delivary/data/datasource/remote/ordersdetailsdata.dart';
import 'package:delivary/data/model/cartmodel.dart';
import 'package:delivary/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/statusrequest.dart';
import '../handlingdatacontroller.dart';

class Ordersdetailscontroller extends GetxController {
  Ordersdetailsdata ordersdetailsdata = Ordersdetailsdata(Get.find());

  late Completer<GoogleMapController> completercontroller;
  CameraPosition? cameraPosition;

  List<Cartmodel> data = [];
  late StatusRequest statusRequest;
  List<Marker> markers = [];
  double? lat;
  double? long;
  late OrdersModel ordersModel;

  void initialData() {
    completercontroller = Completer<GoogleMapController>();
    if (ordersModel.ordersType == "0") {
      final latLng = LatLng(
        double.parse(ordersModel.addressLat!),
        double.parse(ordersModel.addressLong!),
      );
      cameraPosition = CameraPosition(target: latLng, zoom: 12.4746);
      markers.add(Marker(markerId: MarkerId("1"), position: latLng));
    }
  }

  String translateColor(String color) {
    switch (color.toLowerCase()) {
      case "red":
        return "278".tr; // أحمر
      case "green":
        return "279".tr; // أخضر
      case "blue":
        return "280".tr; // أزرق
      case "yellow":
        return "281".tr; // أصفر
      case "black":
        return "282".tr; // أسود
      case "white":
        return "283".tr; // أبيض
      case "orange":
        return "284".tr; // برتقالي
      case "purple":
        return "285".tr; // أرجواني
      case "pink":
        return "286".tr; // وردي
      case "brown":
        return "287".tr; // بني
      case "gray":
        return "288".tr; // رمادي
      case "cyan":
        return "289".tr; // سماوي
      case "magenta":
        return "290".tr; // أرجواني فاتح
      case "lime":
        return "291".tr; // ليموني
      case "maroon":
        return "292".tr; // خمري
      case "navy":
        return "293".tr; // كحلي
      case "olive":
        return "294".tr; // زيتي
      case "teal":
        return "295".tr; // تركوازي داكن
      case "silver":
        return "296".tr; // فضي
      case "gold":
        return "297".tr; // ذهبي
      case "beige":
        return "298".tr; // بيج
      case "coral":
        return "299".tr; // مرجاني
      case "turquoise":
        return "300".tr; // تركوازي
      case "violet":
        return "301".tr; // بنفسجي
      case "indigo":
        return "302".tr; // نيلي
      case "lavender":
        return "303".tr; // لافندر
      case "mint":
        return "304".tr; // نعناعي
      case "chocolate":
        return "305".tr; // شكولاته
      case "crimson":
        return "306".tr; // قرمزي
      case "khaki":
        return "307".tr; // كاكي
      case "salmon":
        return "308".tr; // سلموني
      case "plum":
        return "309".tr; // خوخي داكن
      default:
        return color; // إذا لم توجد ترجمة، أرجع النص الأصلي
    }
  }

  @override
  void onInit() {
    super.onInit();
    ordersModel = Get.arguments['ordersmodel'];
    initialData();
    getData();
  }

  Future<void> getData() async {
    statusRequest = StatusRequest.loading;
    update();

    final response = await ordersdetailsdata.getData(ordersModel.ordersId!);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        final List listdata = response['data'];
        data.addAll(listdata.map((e) => Cartmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
