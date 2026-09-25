import 'package:delivary/core/class/statusrequest.dart';
import 'package:delivary/core/constant/routes.dart';
import 'package:get/get.dart';

import '../handlingdatacontroller.dart';
import '../../data/datasource/remote/forgetpassword/verifiycode.dart';

abstract class Veryfiicodecontroller extends GetxController {
  checkcode();

  goToResetpassword(String verifiycode);
}

class VeryfiycodecontrollerImp extends Veryfiicodecontroller {
  String? email;
  StatusRequest statusRequest = StatusRequest.none;

  VerifiyCodeForgetPasswordData verifiyCodeForgetPasswordData =
  VerifiyCodeForgetPasswordData(Get.find());

  @override
  checkcode() {}

  @override
  goToResetpassword(verifiycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifiyCodeForgetPasswordData.postData(email!, verifiycode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.restPasswoed, arguments: {
          "email": email,
        });
      } else {
        Get.defaultDialog(
          title: "63".tr,
          middleText: "72".tr,
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
