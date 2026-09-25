import 'package:get/get.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';

import '../handlingdatacontroller.dart';
import '../../data/datasource/remote/forgetpassword/verifiycode.dart';

abstract class Veryfiicodecontroller extends GetxController {
  checkcode();

  goToResetpassword(String verifiycode);
}

class VeryfiycodecontrollerImp extends Veryfiicodecontroller {
  String? email;
  StatusRequest statusRequest = StatusRequest.none;

  final VerifiyCodeForgetPasswordData verifiyCodeForgetPasswordData =
  VerifiyCodeForgetPasswordData(Get.find());

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
  }

  @override
  checkcode() {
    // إذا تريد تضيف منطق تحقق يمكنك إضافته هنا
  }

  @override
  Future<void> goToResetpassword(String verifiycode) async {
    statusRequest = StatusRequest.loading;
    update();

    final response = await verifiyCodeForgetPasswordData.postData(email!, verifiycode);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.restPasswoed, arguments: {"email": email});
      } else {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
          title: "63".tr,
          middleText: "72".tr,
        );
      }
    }

    update();
  }
}
