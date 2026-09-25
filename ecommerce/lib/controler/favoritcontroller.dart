import 'package:ecommerse/data/datasource/remote/favorite/favoritedata.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import 'handlingdatacontroller.dart';
import '../core/services/services.dart';

class Favoritcontroller extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());

  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  Map isFavorite = {};

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
      myServices.sharedPreferences.getString("id")!, itemsid,);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("63".tr, "79".tr);

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("63".tr, "80".tr);

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
