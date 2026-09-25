import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/remote/orders/pending.dart';
import 'package:admin/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../handlingdatacontroller.dart';

class Pandingcontroller extends GetxController {
  final PandingData pandingData = PandingData(Get.find());
  final MyServices myServices = Get.find();

  List<OrdersModel> data = [];
  late StatusRequest statusRequest;

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

  Future<void> callNumber(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'لا يمكن فتح تطبيق الاتصال';
    }
  }

  Future<void> getorders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pandingData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data
          ..clear()
          ..addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> approveorders(String userid, String orderid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pandingData.approveData(userid, orderid);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        data.removeWhere((order) => order.ordersId == orderid);
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  void refreshorder() {
    getorders();
  }

  Future<void> refreshData() async {
    await getorders();
    update();
  }

  @override
  void onInit() {
    getorders();
    super.onInit();
  }
}
