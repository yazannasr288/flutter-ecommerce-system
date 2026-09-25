import 'package:ecommerse/core/class/statusrequest.dart';
import 'package:ecommerse/core/services/services.dart';
import 'package:ecommerse/data/datasource/remote/orderspandingdata.dart';
import 'package:ecommerse/data/model/ordersmodel.dart';
import 'package:get/get.dart';

import '../handlingdatacontroller.dart';

class Pandingcontroller extends GetxController {
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  PandingData pandingData = PandingData(Get.find());

  String printtyprorder(String val) {
    if (val == "0") {
      return "119".tr;
    } else {
      return "159".tr;
    }
  }

  String printpamentmetodeorder(String val) {
    if (val == "0") {
      return "116".tr;
    } else {
      return "117".tr;
    }
  }

  String printorderstatus(String val)  {
    if (val == "0") {
      return "160".tr;
    } else if (val == "1") {
      return "161".tr;
    } else if (val == "2") {
      return "162".tr;
    } else if(val=="3") {
      return "163".tr;
    } else  {
      return "164".tr;
    }
  }

  getprders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await pandingData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  } deleteorders(String orderid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await pandingData.deletedata(orderid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
      refreshorder();
      }else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  refreshorder(){
    getprders();
  }

  @override
  void onInit() {
    getprders();
    super.onInit();
  }
}
