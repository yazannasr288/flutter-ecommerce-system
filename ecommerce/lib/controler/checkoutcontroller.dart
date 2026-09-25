import 'package:ecommerse/core/class/statusrequest.dart';
import 'package:ecommerse/core/services/services.dart';
import 'package:ecommerse/data/datasource/remote/checkout.dart';
import 'package:ecommerse/data/model/addressmodel.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../data/datasource/remote/addressdata.dart';

import 'handlingdatacontroller.dart';

class Checkoutcontroller extends GetxController {
  Addressdata addressdata = Get.put(Addressdata(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  String? paymethod;
  String? delivarytype;
  String? addressid;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<AddressModel> dataaddress = [];
  late String coponid;
  late String copondiscount;
  late String priceorders;

  choosepaymentmethor(String val) {
    paymethod = val;
    update();
  }

  choosedelivarytype(String val) {
    delivarytype = val;
    update();
  }

  chooseshippingaddress(String val) {
    addressid = val;
    update();
  }

  getshippingaddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressdata.getData(

      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        addressid = dataaddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.success;
      }
    }
    update();
  }


  checkout() async {
    if (paymethod ==null) {
      return Get.snackbar("63".tr, "74".tr);
    }
    if (delivarytype == null) {
      return Get.snackbar("63".tr, "75".tr);
    }
      if (dataaddress.isEmpty&&delivarytype=="0" ) {
      Get.snackbar("63".tr, "76".tr);
      return Get.toNamed(AppRoutes.addressadd) ;
    }

    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressid.toString(),
      "orderstype": delivarytype.toString(),
      "pricedilivary": "10",
      "ordersprice": priceorders,
      "coponid": coponid,
      "copondiscount" : copondiscount.toString() ,
      "paymethod": paymethod.toString()
    };

    var response = await checkoutData.checkout(data);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.homepage);
        Get.snackbar("63".tr, "77".tr);
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("63".tr, "78".tr);
      }
      // End
    }
    update();
  }

  @override
  void onInit() {

    coponid = Get.arguments['coponid'].toString();
    priceorders = Get.arguments['ordersprice'];
    copondiscount = Get.arguments['copondiscount'].toString();
    getshippingaddress();
    super.onInit();
  }
}
