import 'package:ecommerse/core/class/statusrequest.dart';
import 'package:ecommerse/core/services/services.dart';
import 'package:ecommerse/data/datasource/remote/archivedata.dart';
import 'package:ecommerse/data/model/ordersmodel.dart';
import 'package:get/get.dart';

import '../handlingdatacontroller.dart';

class Archivecontroller extends GetxController {
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());

  String printtyprorder(String val) {
    if (val == "0") {
      return "delivary";
    } else {
      return "recive";
    }
  }

  String printpamentmetodeorder(String val) {
    if (val == "0") {
      return "cash on delivary";
    } else {
      return "payment card";
    }
  }

  String printorderstatus(String val) {
    if (val == "0") {
      return "await approve";
    } else if (val == "1") {
      return "prepare ";
    } else if (val == "2") {
      return "on the way";
    } else if (val == "3") {
      return "on the way";
    } else {
      return "archice";
    }
  }

  getorders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshorder() {
    getorders();
  }

  submetrataing(String ordersid, double rating, String comment) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData.ratingdata(
      ordersid,
      comment,
      rating.toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getorders();
      } else {
        statusRequest = StatusRequest.success;
      }
    }
    update();
  }

  @override
  void onInit() {
    getorders();
    super.onInit();
  }
}
