import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/remote/orders/archivedata.dart';
import 'package:admin/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../handlingdatacontroller.dart';

class Archivecontroller extends GetxController {
  final List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  final MyServices myServices = Get.find();
  final OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());

  String printtyprorder(String val) => val == "0" ? "119".tr : "120".tr;

  Future<void> callNumber(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw '268'.tr;
    }
  }

  String printpamentmetodeorder(String val) => val == "0" ? "116".tr : "117".tr;

  String printorderstatus(String val) {
    switch (val) {
      case "0":
        return "184".tr;
      case "1":
        return "185".tr;
      case "2":
        return "186".tr;
      case "3":
        return "187".tr;
      default:
        return "188".tr;
    }
  }

  Future<void> getorders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await ordersArchiveData.getData();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  void refreshorder() => getorders();

  Future<void> refreshData() async {
    await getorders();
  }

  @override
  void onInit() {
    getorders();
    super.onInit();
  }
}
