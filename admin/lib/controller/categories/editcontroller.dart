import 'dart:io';

import 'package:admin/controller/categories/viewcontroller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/uploadfile.dart';
import 'package:admin/data/datasource/remote/categoriesdata.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../handlingdatacontroller.dart';

class CatEditcontroller extends GetxController {
  final Categoriesdata categoriesdata = Categoriesdata(Get.find());
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late final TextEditingController name;
  late final TextEditingController namear;
  CategoriesModel? categoriesModel;

  StatusRequest statusRequest = StatusRequest.none;
  File? file;

  Future<void> chooseimage() async {
    file = await fileUploadGallery(true);
    update();
  }

  Future<void> editData() async {
    if (!formstate.currentState!.validate()) return;

    update();

    final data = {
      "name": name.text,
      "namear": namear.text,
      "imageold": categoriesModel!.categoriesImage!,
      "id": categoriesModel!.categoriesId!,
    };

    statusRequest = StatusRequest.loading;
    final response = await categoriesdata.edit(data, file);
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
    categoriesModel = Get.arguments['categoriesModel'];
    name = TextEditingController(text: categoriesModel!.categories_name);
    namear = TextEditingController(text: categoriesModel!.categories_name_ar);
    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    namear.dispose();
    super.onClose();
  }
}
