import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/datasource/remote/orders/accepteddata.dart';
import '../handlingdatacontroller.dart';

class Acceptedcontroller extends GetxController {
  final Accepteddata accepteddata = Accepteddata(Get.find());

  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  final MyServices myServices = Get.find();

  Future<void> callNumber(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'لا يمكن فتح تطبيق الاتصال';
    }
  }

  String printtyprorder(String val) {
    return val == "0" ? "119".tr : "159".tr;
  }

  String printpamentmetodeorder(String val) {
    return val == "0" ? "116".tr : "117".tr;
  }

  String printorderstatus(String val) {
    switch (val) {
      case "0":
        return "160".tr;
      case "1":
        return "161".tr;
      case "2":
        return "162".tr;
      case "3":
        return "163".tr;
      default:
        return "164".tr;
    }
  }

  Future<void> getorders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await accepteddata.getData();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data = listdata.map((e) => OrdersModel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> doneprepare(String ordersid, String usersid, String orderstype) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await accepteddata.doneprepare(ordersid, usersid, orderstype);
    statusRequest = handlingData(response);

    if (statusRequest != StatusRequest.success || response['status'] != "success") {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  void refreshorder() {
    getorders();
  }

  Future<void> refreshData() async {
    await getorders();
  }

  @override
  void onInit() {
    getorders();
    super.onInit();
  }
}
