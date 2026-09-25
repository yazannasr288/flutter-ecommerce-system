import 'package:ecommerse/core/class/statusrequest.dart';
import 'package:ecommerse/core/constant/routes.dart';
import 'package:ecommerse/core/services/services.dart';
import 'package:ecommerse/data/datasource/remote/addressdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/model/addressmodel.dart';
import '../handlingdatacontroller.dart';

class AddAddressdtailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  Addressdata addressdata = Addressdata(Get.find());
  MyServices myServices = Get.find();


  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? note;
  bool isEdit = false;
  late AddressModel? oldAddress;

  String? lat;

  String? long;
  initialData() {
    var args = Get.arguments;
    isEdit = args['isEdit'] ?? false;

    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    note = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];

    if (isEdit) {
      oldAddress = args['addressModel'];
      name!.text = oldAddress!.addressName!;
      city!.text = oldAddress!.addressCity!;
      street!.text = oldAddress!.addressStreet!;
      note!.text = oldAddress!.addressnote!;
      lat = oldAddress!.addressLat!;
      long = oldAddress!.addressLong!;
    } else {
      lat = args['lat'];
      long = args['long'];
    }
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressdata.addData(
      myServices.sharedPreferences.getString("id")!,
      name!.text,
      city!.text,
      street!.text,
      lat!,
      long!,
      note!.text,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.toNamed(AppRoutes.addressview,arguments: {"from": "add"});
        Get.snackbar("63".tr, "65".tr);
      } else {
        statusRequest = StatusRequest.failure;
      }

    }
    update();

  }

  editAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressdata.editData(
      oldAddress!.addressId!,
      name!.text,
      city!.text,
      street!.text,
      lat!,
      long!,
      note!.text,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.addressview,arguments: {"from": "edit"});
        Get.snackbar("63".tr, "64".tr);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
