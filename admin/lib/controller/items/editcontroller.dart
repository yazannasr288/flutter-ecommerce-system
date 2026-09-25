import 'dart:io';

import 'package:admin/controller/items/viewcontroller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/uploadfile.dart';
import 'package:admin/data/model/itemsmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/colorsitems.dart';
import '../../data/datasource/remote/categoriesdata.dart';
import '../../data/datasource/remote/itemsdata.dart';
import '../../data/model/categoriesmodel.dart';
import '../handlingdatacontroller.dart';

class ItemsEditcontroller extends GetxController {
  Itemsdata itemsdata = Itemsdata(Get.find());
  ItemsModel? itemsModel;

  String? active;

  List<SelectedListItem> dropdownlist = [];
  List<SelectedListItem> colorsList = itemscolorsList;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController dropdownname;
  late TextEditingController dropdownid;
  late TextEditingController namear;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  TextEditingController? catname;
  TextEditingController? catid;
  late TextEditingController colorsSelectedText;

  StatusRequest statusRequest = StatusRequest.none;
  File? file;

  @override
  void onInit() {
    super.onInit();

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
    colorsSelectedText = TextEditingController();

    itemsModel = Get.arguments['itemsModel'];

    // تعيين القيم من الموديل
    name.text = itemsModel!.itemsName ?? "";
    active = itemsModel!.itemsActive;
    namear.text = itemsModel!.itemsNameAr ?? "";
    desc.text = itemsModel!.itemsDesc ?? "";
    descar.text = itemsModel!.itemsDescAr ?? "";
    price.text = itemsModel!.itemsPrice ?? "";
    discount.text = itemsModel!.itemsDiscount ?? "";
    count.text = itemsModel!.itemsCount ?? "";
    catid!.text = itemsModel!.categoriesId ?? "";
    catname!.text = itemsModel!.categoriesName ?? "";
    colorsSelectedText.text = itemsModel!.itemsColors ?? "";

    // جلب التصنيفات
    getcategoris();

    // تعيين حالة ألوان المحددة
    markSelectedColors();
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

    colorsSelectedText.dispose();

    super.onClose();
  }

  void changestateactive(String? val) {
    active = val;
    update();
  }

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

  Future<void> editData() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      Map<String, dynamic> data = {
        "name": name.text,
        "active": active,
        "id": itemsModel!.itemsId!,
        "imageold": itemsModel!.itemsImage!,
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

      var response = await itemsdata.edit(data, file);
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
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

  /// تفصل النص إلى قائمة ألوان
  List<String> getInitialColorValues() {
    final text = colorsSelectedText.text;
    if (text.isEmpty) return [];
    return text.split(',').map((s) => s.trim()).toList();
  }

  /// تعيين حالة التحديد للألوان حسب النص في colorsSelectedText
  void markSelectedColors() {
    final initial = getInitialColorValues();
    for (var item in colorsList) {
      item.isSelected = initial.contains(item.value);
    }
  }

  /// جلب بيانات التصنيفات وتحضير قائمة dropdownlist
  Future<void> getcategoris() async {
    Categoriesdata categoriesdata = Categoriesdata(Get.find());

    statusRequest = StatusRequest.loading;
    update();

    var response = await categoriesdata.getData();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        dropdownlist.clear();
        List datalist = response['data'];
        List<CategoriesModel> data = datalist.map((e) => CategoriesModel.fromJson(e)).toList();

        String currentLang = Get.locale?.languageCode ?? 'en';

        for (var category in data) {
          String? name = currentLang == 'ar' ? category.categories_name_ar : category.categories_name;
          dropdownlist.add(SelectedListItem(data: name, value: category.categoriesId.toString()));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }
}
