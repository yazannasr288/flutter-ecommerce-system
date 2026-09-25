import 'package:admin/data/datasource/remote/adminaccount.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/services/services.dart';

class HomecontrollerImp extends GetxController {
  MyServices myServices = Get.find();
  AdminAccountData adminAccountData = AdminAccountData(Get.find());

  logut() async {
    String adminid = myServices.sharedPreferences.getString("id")!;
    await FirebaseMessaging.instance.unsubscribeFromTopic("admin");
    await FirebaseMessaging.instance.unsubscribeFromTopic("admin$adminid");
    await myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }
  void checkApproveStatus() async {
    String? adminId = myServices.sharedPreferences.getString("id");
    if (adminId == null) return;

    var response = await adminAccountData.view(adminId);
    if (response['status'] == 'success') {
      if (response['data']['admin_aproove'].toString() != "1") {
        await myServices.sharedPreferences.clear();
        Get.offAllNamed(AppRoutes.login);
        Get.snackbar("تم تسجيل الخروج", "تم إيقاف حسابك من قبل الإدارة");
      }
    }
  }
  @override
  void onInit() {
    checkApproveStatus();
    super.onInit();
  }


}
