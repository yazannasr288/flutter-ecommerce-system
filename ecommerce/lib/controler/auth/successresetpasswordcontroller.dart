import 'package:ecommerse/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController{

  gotopageLogin();
}
class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  gotopageLogin() {
   Get.offAllNamed(AppRoutes.login);
  }

}