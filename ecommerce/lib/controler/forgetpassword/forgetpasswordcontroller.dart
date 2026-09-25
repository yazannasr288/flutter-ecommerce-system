import 'package:ecommerse/core/constant/routes.dart';
import 'package:ecommerse/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../handlingdatacontroller.dart';

abstract class Forgetpasswordcontroller extends GetxController {
  checkemail();

}

class ForgetpasswordcontrollerImp extends Forgetpasswordcontroller {
  CheckemailData checkemailData =CheckemailData(Get.find());
  GlobalKey<FormState> formstate =GlobalKey<FormState>();
  late TextEditingController email;
  StatusRequest statusRequest=StatusRequest.none;


  @override
  checkemail() async{
    if (formstate.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkemailData.postData( email.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
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
  }



  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
