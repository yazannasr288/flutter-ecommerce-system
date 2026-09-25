import 'package:ecommerse/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';

import '../core/services/services.dart';
import '../data/datasource/remote/cartdata.dart';
import 'handlingdatacontroller.dart';

abstract class Productdetailscontroller extends GetxController {

}

class ProductdetailscontrollerImp extends Productdetailscontroller {
  late ItemsModel itemsModel;
  late StatusRequest statusRequest;
  int countitems = 0;
  String delivarytime = "";
  String delivarytimeextra = "";
  MyServices myServices = Get.find();


  Cartdata cartdata = Cartdata(Get.find());


  initialData() async {
    delivarytime= myServices.sharedPreferences.getString("delivarytime")?? "0";
    delivarytimeextra= myServices.sharedPreferences.getString("delivarytimeextra")?? "0";
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await getcountitems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }
  getcountitems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartdata.getcountcart(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0;
        countitems =response['data'];
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  additems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.addcart(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("63".tr, "81".tr) ;


      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteitems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartdata.deletecart(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("Warning", "تم الازالة") ;


      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }


  List subtitles = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "black", "id": 2, "active": '0'},
    {"name": "white", "id": 3, "active": '1'},
  ];

  add() {
    additems(itemsModel.itemsId!);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
     deleteitems(itemsModel.itemsId!);
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
