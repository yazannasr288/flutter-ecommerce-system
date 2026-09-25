import 'dart:io';

import 'package:admin/controller/categories/viewcontroller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/uploadfile.dart';
import 'package:admin/data/datasource/remote/categoriesdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../handlingdatacontroller.dart';

class CatAddcontroller extends GetxController {
  final Categoriesdata categoriesdata = Categoriesdata(Get.find());
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late final TextEditingController name;
  late final TextEditingController namear;

  StatusRequest statusRequest = StatusRequest.none;
  File? file;

  Future<void> chooseimage() async {
    file = await fileUploadGallery(true);
    update();
  }

  Future<void> addData() async {
    if (!formstate.currentState!.validate()) return;

    if (file == null) {
      Get.snackbar("63".tr, "182".tr);
      return;
    }

    update();
    final data = {"name": name.text, "namear": namear.text};
    statusRequest = StatusRequest.loading;

    final response = await categoriesdata.add(data, file!);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.categoriesView);
        Get.find<CatViewcontroller>().getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    namear.dispose();
    super.onClose();
  }
}
