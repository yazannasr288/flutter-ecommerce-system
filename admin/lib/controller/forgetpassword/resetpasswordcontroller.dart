import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../data/datasource/remote/forgetpassword/resetpassword.dart';
import '../handlingdatacontroller.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final ResetpasswordData resetPasswordData = ResetpasswordData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  late final TextEditingController password;
  late final TextEditingController repassword;

  String? email;

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }

  @override
  resetpassword() {
    // يمكن تفعيلها أو حذفها إذا غير مستخدمة
  }

  @override
  Future<void> goToSuccessResetPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
        title: "63".tr,
        middleText: "70".tr,
      );
    }

    if (!formstate.currentState!.validate()) return;

    statusRequest = StatusRequest.loading;
    update();

    final response = await resetPasswordData.postData(email!, password.text);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.successResetPassword);
      } else {
        Get.defaultDialog(
          title: "63".tr,
          middleText: "71".tr,
        );
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }
}
