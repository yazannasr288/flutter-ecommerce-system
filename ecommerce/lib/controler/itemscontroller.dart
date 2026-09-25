import 'package:ecommerse/controler/homecontroller.dart';
import 'package:ecommerse/core/services/services.dart';
import 'package:ecommerse/data/datasource/remote/itemsData.dart';
import 'package:ecommerse/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import 'favoritcontroller.dart';
import 'handlingdatacontroller.dart';

abstract class Itemscontroller extends GetxController {
  initialData();

  changeCat(int val, String catval);

  getItems(String categoryid);

  gotopageproductdetails(ItemsModel itemsmodel);
}

class ItemscontrollerImp extends Searchmixcontroller {

  List categories = [];
  String? catid;
  String delivarytime = "";
  String delivarytimeextra = "";

  int? selectCat;

  Itemsdata itemsdata = Itemsdata(Get.find());

  List data = [];
  @override
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    super.onInit();
  }

  initialData() {
    delivarytime= myServices.sharedPreferences.getString("delivarytime")?? "0";
    delivarytimeextra= myServices.sharedPreferences.getString("delivarytimeextra")?? "0";
    categories = Get.arguments['categories'];
    selectCat = Get.arguments['selectCat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  changeCat(val, catval) {
    selectCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsdata.getData(
      categoryid,
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
        Favoritcontroller favoritController = Get.find();
        for (var item in response['data']) {
          favoritController.setFavorite(item['items_id'].toString(), item['favorite'].toString());
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  gotopageproductdetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}
