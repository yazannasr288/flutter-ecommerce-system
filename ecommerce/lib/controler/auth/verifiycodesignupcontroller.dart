import 'package:ecommerse/core/constant/routes.dart';
import 'package:ecommerse/data/datasource/remote/auth/verifiycodesignup.dart';

import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../handlingdatacontroller.dart';

abstract class Verifiycodesignupcontroller extends GetxController {
  checkcode();

  goToSuccessSignup(String verificationCode);
}

class VerifiycodesignupcontrollerImp extends Verifiycodesignupcontroller {
  VerifiycodesignupData verifiycodesignupData = VerifiycodesignupData(
    Get.find(),
  );

  String? email;
  StatusRequest statusRequest=StatusRequest.none;

  @override
  checkcode() {}

  @override
  goToSuccessSignup(verfiyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifiycodesignupData.postData(email!, verfiyCodeSignUp);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.successSignup);
      } else {
        Get.defaultDialog(
            title: "63".tr,
            middleText: "68".tr);
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
  resend(){
    verifiycodesignupData.resendData(email!);
  }

}
