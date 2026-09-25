import 'package:delivary/core/class/statusrequest.dart';
import 'package:delivary/core/services/services.dart';
import 'package:delivary/data/datasource/remote/archivedata.dart';
import 'package:delivary/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../handlingdatacontroller.dart';

class Archivecontroller extends GetxController {
  final List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  final MyServices myServices = Get.find();
  final OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());

  String printtyprorder(String val) =>
      val == "0" ? "119".tr : "159".tr;

  String printpamentmetodeorder(String val) =>
      val == "0" ? "116".tr : "117".tr;

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

    final response = await ordersArchiveData.getData(
      myServices.sharedPreferences.getString("id")!,
    );

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        final List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> callNumber(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'لا يمكن فتح تطبيق الاتصال';
    }
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
