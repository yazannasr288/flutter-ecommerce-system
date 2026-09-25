

import 'package:delivary/view/screen/forgetpassword/resetpassword.dart';
import 'package:delivary/view/screen/forgetpassword/successresetpassword.dart';
import 'package:delivary/view/screen/forgetpassword/veryfiicode.dart';
import 'package:delivary/view/screen/forgetpassword/forgetpassword.dart';
import 'package:delivary/view/screen/homescreen.dart';
import 'package:delivary/view/screen/languge.dart';
import 'package:delivary/view/screen/langugeinapp.dart';
import 'package:delivary/view/screen/onboarding.dart';
import 'package:delivary/view/screen/orders/accepted.dart';
import 'package:delivary/view/screen/orders/archive.dart';
import 'package:delivary/view/screen/orders/ordersdetails.dart';
import 'package:delivary/view/screen/orders/panding.dart';
import 'package:delivary/view/screen/orders/tracking.dart';
import 'package:get/get.dart';
import 'core/constant/routes.dart';
import 'core/midellware/mymidelware.dart';
import 'view/screen/auth/login.dart';

List<GetPage<dynamic>>? route = [
  GetPage(name: "/", page: () => Language(), middlewares: [Mymidelware()]),
  GetPage(name: AppRoutes.login, page: () => Login()),
  GetPage(name: AppRoutes.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoutes.verifiyCode, page: () => Verifiycode()),
  GetPage(name: AppRoutes.accepted, page: () => Accepted()),
  GetPage(name: AppRoutes.homepage, page: () => Homescreen()),

  GetPage(name: AppRoutes.restPasswoed, page: () => Resetpassword()),
  GetPage(name: AppRoutes.onBoarding, page: () => OnBoarding()),
  GetPage(name: AppRoutes.language, page: () => Language()),

  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => SuccessResetPassword(),
  ),
  GetPage(name: AppRoutes.panding, page: () => Panding()),
  GetPage(name: AppRoutes.archive, page: () => Archive()),
  GetPage(name: AppRoutes.ordersdetails, page: () => Ordersdetails()),
  GetPage(name: AppRoutes.tracking, page: () => Tracking()),
  GetPage(name: AppRoutes.languageinapp, page: () => Langugeinapp()),
];
