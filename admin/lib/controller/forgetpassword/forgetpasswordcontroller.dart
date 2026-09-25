import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../data/datasource/remote/forgetpassword/checkemail.dart';
import '../handlingdatacontroller.dart';

abstract class Forgetpasswordcontroller extends GetxController {
  checkemail();
}

class ForgetpasswordcontrollerImp extends Forgetpasswordcontroller {
  final CheckemailData checkemailData = CheckemailData(Get.find());
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late final TextEditingController email;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  Future<void> checkemail() async {
    if (!formstate.currentState!.validate()) return;

    statusRequest = StatusRequest.loading;
    update();

    final response = await checkemailData.postData(email.text);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(
          AppRoutes.verifiyCode,
          arguments: {"email": email.text},
        );
      } else {
        Get.defaultDialog(
          title: "63".tr,
          middleText: "69".tr,
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
