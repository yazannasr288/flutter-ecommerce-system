import 'package:admin/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  void gotopageLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  void gotopageLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
