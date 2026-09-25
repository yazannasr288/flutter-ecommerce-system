import 'package:delivary/core/class/statusrequest.dart';
import 'package:delivary/core/services/services.dart';
import 'package:delivary/data/datasource/remote/orderspandingdata.dart';
import 'package:delivary/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constant/routes.dart';
import '../handlingdatacontroller.dart';

class Pandingcontroller extends GetxController {
  final PandingData pandingData = PandingData(Get.find());
  final List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  final MyServices myServices = Get.find();

  String printtyprorder(String val) => val == "0" ? "119".tr : "159".tr;

  String printpamentmetodeorder(String val) => val == "0" ? "116".tr : "117".tr;

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
    statusRequest = StatusRequest.loading;
    update();

    final response = await pandingData.getData();

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        final List listdata = response['data'];
        data.clear();
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> approveorders(String userid, String orderid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    final response = await pandingData.approveData(
      myServices.sharedPreferences.getString("id")!,
      userid,
      orderid,
    );

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        data.removeWhere((order) => order.ordersId == orderid);
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
    await checkApproveStatus();
    update();
  }

  Future<void> checkApproveStatus() async {
    final String? delivaryId = myServices.sharedPreferences.getString("id");
    if (delivaryId == null) return;

    final response = await pandingData.checkApprove(delivaryId);

    if (response['status'] == 'notapproved') {
      await myServices.sharedPreferences.clear();
      Get.offAllNamed(AppRoutes.login);
      Get.snackbar("تم تسجيل الخروج", "تم إيقاف حسابك من قبل الإدارة");
    }
  }

  @override
  void onInit() {
    checkApproveStatus();
    getorders();
    super.onInit();
  }
}
