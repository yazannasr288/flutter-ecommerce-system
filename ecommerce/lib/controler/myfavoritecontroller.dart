import 'package:ecommerse/controler/homecontroller.dart';
import 'package:ecommerse/data/model/myfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../data/model/itemsmodel.dart';
import 'handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/favorite/myfavoritedata.dart';

class MyFavoritcontroller extends Searchmixcontroller {
  Myfavoritedata favoriteData = Myfavoritedata(Get.find());

  List<MyFavoriteModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];

        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromFavorite(String favoriteid) {
    var response = favoriteData.deleteData(favoriteid);

    data.removeWhere((element) => element.favoriteId == favoriteid);

    update();
  }

  void gotopageproductdetailsFromFavorite(MyFavoriteModel fav) {
    ItemsModel item = ItemsModel(
      itemsId: fav.itemsId,
      itemsName: fav.itemsName,
      itemsNameAr: fav.itemsNameAr,
      itemsDesc: fav.itemsDesc,
      itemsDescAr: fav.itemsDescAr,
      itemsPrice: fav.itemsPrice,
      itemsDiscount: fav.itemsDiscount,
      itemsImage: fav.itemsImage,
      itemspricediscount: fav.pricediscount,
    );

    Get.toNamed("productdetails", arguments: {"itemsmodel": item});
  }

  // -------------------------------------------------------

  @override
  void onInit() {
    search = TextEditingController();

    getData();
    super.onInit();
  }
}
