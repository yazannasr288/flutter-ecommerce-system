import 'package:ecommerse/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController{

  gotopageLogin();
}
class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  gotopageLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

}