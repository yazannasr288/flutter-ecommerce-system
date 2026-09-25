import 'package:ecommerse/core/constant/routes.dart';
import 'package:ecommerse/core/services/services.dart';
import 'package:ecommerse/data/datasource/remote/homebestdata.dart';
import 'package:ecommerse/data/datasource/remote/homedata.dart';
import 'package:ecommerse/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import 'handlingdatacontroller.dart';

abstract class Homecontroller extends Searchmixcontroller {
  initilData();

  gotoitems(List categories, int selectCat, String categoryid);

  getdata();
  getdatabest();
}

class HomecontrollerImp extends Homecontroller {
  List categories = [];
  List items = [];
  List bestitems = [];
  List offersdata = [];
String? offerimage ;
  MyServices myServices = Get.find();
  String? username;
  String? id;
  String? lang;
  String delivarytimeextra ="";
  String delivarytime ="";

  HomeData homeData = HomeData(Get.find());
  HomebestData homebestData = HomebestData (Get.find());

  @override
  initilData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
    lang = myServices.sharedPreferences.getString("lang");
  }


  @override
  void onInit() {
    search = TextEditingController();
    getdata();
    getdatabest();
    initilData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        offersdata.addAll(response['surprice']['data']);
        offerimage= offersdata[0]['surprice_image'];
        delivarytime= offersdata[0]['arrive_time'].toString();
        delivarytimeextra= offersdata[0]['extra_arrive_time'].toString();
        myServices.sharedPreferences.setString("delivarytimeextra", delivarytimeextra);
        myServices.sharedPreferences.setString("delivarytime", delivarytime);

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  @override
  getdatabest() async {
    statusRequest = StatusRequest.loading;
    var response = await homebestData.getbestData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // categories.addAll(response['categories']['data']);
        bestitems.addAll(response['itemsbest']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  gotoitems(categories, selectCat, categoryid) {
    Get.toNamed(
      AppRoutes.items,
      arguments: {
        "categories": categories,
        "selectCat": selectCat,
        "catid": categoryid,
      },
    );
  }

  gotopageproductdetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}

class Searchmixcontroller extends GetxController {
  List<ItemsModel> listdata = [];

  late StatusRequest statusRequest;
  HomeData homeData = HomeData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List respnsedata = response['data'];
        listdata.addAll(respnsedata.map((e) => ItemsModel.fromJson(e)));

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }



  bool isSearch = false;
  TextEditingController? search;

  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    } else {
    }
    update();
  }


  onSearchitems() {
    isSearch = true;
    searchData();

    update();
  }
  onDeleteSearch() {
    search!.clear();
    isSearch = false;
    statusRequest = StatusRequest.none;
    update();
  }
}
