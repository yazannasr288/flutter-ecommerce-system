import 'package:ecommerse/core/services/services.dart';
import 'package:ecommerse/data/datasource/remote/notificationData.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import 'handlingdatacontroller.dart';

class NotificationController extends GetxController{


  Notificationdata notificationdata = Notificationdata(Get.find());

  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationdata.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      }
      else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
