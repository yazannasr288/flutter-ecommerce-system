import 'package:ecommerse/controler/homecontroller.dart';
import 'package:ecommerse/core/class/statusrequest.dart';
import 'package:ecommerse/data/datasource/remote/offerdata.dart';
import 'package:ecommerse/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'handlingdatacontroller.dart';

class Offercontroller extends Searchmixcontroller {
  Offerdata offerdata = Offerdata(Get.find());

  List<ItemsModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offerdata.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata2 = response['data'];
        data.addAll(listdata2.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  gotopageproductdetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onInit() {
    search =TextEditingController();
    getData();
    super.onInit();
  }
}
