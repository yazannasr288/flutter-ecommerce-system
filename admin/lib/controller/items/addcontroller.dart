import 'dart:io';
import 'package:admin/core/constant/colorsitems.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:admin/controller/items/viewcontroller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/uploadfile.dart';
import 'package:admin/data/datasource/remote/itemsdata.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/categoriesdata.dart';
import '../handlingdatacontroller.dart';

class ItemsAddcontroller extends GetxController {
  Itemsdata itemsdata = Itemsdata(Get.find());
  List<SelectedListItem> dropdownlist = [];
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController dropdownname;
  late TextEditingController dropdownid;
  late TextEditingController namear;

  List<SelectedListItem> colorsList = itemscolorsList;

  late TextEditingController colorsSelectedText;

  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  TextEditingController? catname;
  TextEditingController? catnamear;
  TextEditingController? catid;
  StatusRequest statusRequest = StatusRequest.none;
  File? file;

  showoptionImage() {
    showbottommenu(chooseimagecamera, chooseimagegallary);
  }

  chooseimagecamera() async {
    file = await imageUploadCamera();
    update();
  }

  chooseimagegallary() async {
    file = await fileUploadGallery(false);
    update();
  }

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file == null) {
        Get.snackbar("63".tr, "183".tr);
        return;
      }

      update();
      Map data = {
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "count": count.text,
        "price": price.text,
        "discount": discount.text,
        "datenow": DateTime.now().toString(),
        "catid": catid!.text,
        "colors": colorsSelectedText.text,
      };
      statusRequest = StatusRequest.loading;
      var response = await itemsdata.add(data, file!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.itemsview);
          ItemsViewcontroller c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  getcategoris() async {
    Categoriesdata categoriesdata = Categoriesdata(Get.find());

    statusRequest = StatusRequest.loading;
    update();

    var response = await categoriesdata.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        dropdownlist.clear();
        List<CategoriesModel> data = [];
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));

        String currentLang = Get.locale?.languageCode ?? 'en';

        for (int i = 0; i < data.length; i++) {
          String? name =
          currentLang == 'ar'
              ? data[i].categories_name_ar
              : data[i].categories_name;

          dropdownlist.add(
            SelectedListItem(
              data: name,
              value: data[i].categoriesId.toString(),
            ),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getcategoris();

    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    discount = TextEditingController();
    price = TextEditingController();
    count = TextEditingController();

    dropdownname = TextEditingController();
    dropdownid = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();
    catnamear = TextEditingController();
    colorsSelectedText = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    namear.dispose();
    desc.dispose();
    descar.dispose();
    discount.dispose();
    price.dispose();
    count.dispose();

    dropdownname.dispose();
    dropdownid.dispose();
    catid?.dispose();
    catname?.dispose();
    catnamear?.dispose();
    colorsSelectedText.dispose();

    super.onClose();
  }
}
