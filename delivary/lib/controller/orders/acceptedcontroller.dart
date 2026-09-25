import 'package:delivary/core/class/statusrequest.dart';
import 'package:delivary/core/services/services.dart';
import 'package:delivary/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constant/routes.dart';
import '../../data/datasource/remote/accepteddata.dart';
import '../handlingdatacontroller.dart';

class Acceptedcontroller extends GetxController {
  Accepteddata accepteddata = Accepteddata(Get.find());

  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  String printtyprorder(String val) {
    if (val == "0") {
      return "119".tr;
    } else {
      return "159".tr;
    }
  }

  String printpamentmetodeorder(String val) {
    if (val == "0") {
      return "116".tr;
    } else {
      return "117".tr;
    }
  }

  String printorderstatus(String val) {
    if (val == "0") {
      return "160".tr;
    } else if (val == "1") {
      return "161".tr;
    } else if (val == "2") {
      return "162".tr;
    } else if (val == "3") {
      return "163".tr;
    } else {
      return "164".tr;
    }
  }

  getorders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await accepteddata.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  donedelivary(String ordersid, String usersid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await accepteddata.donedelivary(ordersid, usersid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.removeWhere((order) => order.ordersId == ordersid);
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

  Future refreshData() async {
    await getorders();
    update();
  }

  void checkApproveStatus() async {
    String? delivaryId = myServices.sharedPreferences.getString("id");
    if (delivaryId == null) return;

    var response = await accepteddata.getData(delivaryId);
    if (response['status'] == 'success') {
      if (response['data']['delivary_aproove'].toString() != "1") {
        await myServices.sharedPreferences.clear();
        Get.offAllNamed(AppRoutes.login);
        Get.snackbar("تم تسجيل الخروج", "تم إيقاف حسابك من قبل الإدارة");
      }
    }
  }

  @override
  void onInit() {
    checkApproveStatus();
    getorders();
    super.onInit();
  }
}
