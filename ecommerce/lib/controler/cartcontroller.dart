import 'package:ecommerse/data/datasource/remote/cartdata.dart';
import 'package:ecommerse/data/model/cartmodel.dart';
import 'package:ecommerse/data/model/couponmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/services/services.dart';
import 'handlingdatacontroller.dart';

class Cartcontroller extends GetxController {
  TextEditingController? controllercopon;

  late StatusRequest statusRequest;
  CoponModel? coponModel;
  int? discountcopon =0;
  String? coponname ;
  String? coponid;

  MyServices myServices = Get.find();
  List<Cartmodel> data = [];
  double priceorders = 0.0;

  int totalcountitems = 0;

  Cartdata cartdata = Cartdata(Get.find());

  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.addcart(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  goToPageCheckout() {
    if (data.isEmpty) return Get.snackbar("تنبيه", "السله فارغه");
    Get.toNamed(AppRoutes.checkout, arguments: {
      "coponid": coponid ?? "0",
      "ordersprice": priceorders.toString() ,
      "copondiscount" : discountcopon.toString()
    });
    update();
  }

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartdata.deletecart(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  gettotalprice(){
    return (priceorders - priceorders * discountcopon!/100) +10;
  }

  checkcopon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.checkcopon(controllercopon!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacopon = response['data'];
        coponModel = CoponModel.fromJson(datacopon);
        discountcopon =int.parse(coponModel!.coponDiscount!) ;

        coponname=coponModel!.coponName;
        coponid = coponModel!.coponId;

      } else {
        // statusRequest = StatusRequest.success;
        discountcopon =0;
        coponname =null;
        coponid = null;
        Get.snackbar("63".tr, "73".tr) ;

      }
    }
    update();
  }

  resetvarcart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  refrshpage() {
    resetvarcart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.viewcart(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();

          data.addAll(dataresponse.map((e) => Cartmodel.fromJson(e)));
          totalcountitems =int.parse(dataresponsecountprice['totalcount']);
          priceorders =double.parse( dataresponsecountprice['totalprice'].toString());

        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    controllercopon = TextEditingController();
    view();
    super.onInit();
  }
}
