import 'dart:io';
import 'package:admin/controller/offers/viewcontroller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/uploadfile.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/offersdata.dart';
import '../handlingdatacontroller.dart';

class OfferAddcontroller extends GetxController {
  Offersdata offersdata = Offersdata(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  File? file;

  void showoptionImage() {
    showbottommenu(chooseimagecamera, chooseimagegallary);
  }

  Future<void> chooseimagecamera() async {
    file = await imageUploadCamera();
    update();
  }

  Future<void> chooseimagegallary() async {
    file = await fileUploadGallery(false);
    update();
  }

  Future<void> addData() async {
    if (file == null) {
      Get.snackbar("63".tr, "183".tr); // مثلا رسالة تطلب اختيار صورة
      return;
    }
    statusRequest = StatusRequest.loading;
    update();

    Map<String, dynamic> data = {}; // ممكن تضيف حقول أخرى هنا إذا لزم الأمر

    var response = await offersdata.add(data, file!);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.offerview);
        OfferViewcontroller c = Get.find();
        c.getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
