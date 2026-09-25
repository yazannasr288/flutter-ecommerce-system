import 'package:admin/view/screen/adminaccount/adminaccountadd.dart';
import 'package:admin/view/screen/adminaccount/adminaccountedit.dart';
import 'package:admin/view/screen/adminaccount/adminaccountview.dart';
import 'package:admin/view/screen/categories/categoriesadd.dart';
import 'package:admin/view/screen/categories/categoriesedit.dart';
import 'package:admin/view/screen/categories/categoriesview.dart';
import 'package:admin/view/screen/copon/coponadd.dart';
import 'package:admin/view/screen/copon/coponedit.dart';
import 'package:admin/view/screen/copon/coponview.dart';
import 'package:admin/view/screen/delivaryaccount/delivaryaccountadd.dart';
import 'package:admin/view/screen/delivaryaccount/delivaryaccountedit.dart';
import 'package:admin/view/screen/delivaryaccount/delivaryaccountview.dart';
import 'package:admin/view/screen/delivaryprice/delivarypriceedit.dart';
import 'package:admin/view/screen/delivaryprice/delivarypriceview.dart';
import 'package:admin/view/screen/forgetpassword/resetpassword.dart';
import 'package:admin/view/screen/forgetpassword/successresetpassword.dart';
import 'package:admin/view/screen/forgetpassword/veryfiicode.dart';
import 'package:admin/view/screen/forgetpassword/forgetpassword.dart';
import 'package:admin/view/screen/home.dart';
import 'package:admin/view/screen/items/itemsadd.dart';
import 'package:admin/view/screen/items/itemsedit.dart';
import 'package:admin/view/screen/items/itemsview.dart';
import 'package:admin/view/screen/langugeinapp.dart';
import 'package:admin/view/screen/notification.dart';
import 'package:admin/view/screen/offer/offeradd.dart';
import 'package:admin/view/screen/offer/offerview.dart';
import 'package:admin/view/screen/orders/orderscreen.dart';
import 'package:admin/view/screen/languge.dart';
import 'package:admin/view/screen/onboarding.dart';
import 'package:admin/view/screen/orders/accepted.dart';
import 'package:admin/view/screen/orders/archive.dart';
import 'package:admin/view/screen/orders/ordersdetails.dart';
import 'package:admin/view/screen/orders/ordersrating.dart';
import 'package:admin/view/screen/orders/panding.dart';
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
  GetPage(name: AppRoutes.orderscreen, page: () => Orderscreen()),

  GetPage(name: AppRoutes.restPasswoed, page: () => Resetpassword()),
  GetPage(name: AppRoutes.homepage, page: () => Homepage()),
  GetPage(name: AppRoutes.onBoarding, page: () => OnBoarding()),

  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => SuccessResetPassword(),
  ),
  GetPage(name: AppRoutes.panding, page: () => Panding()),
  GetPage(name: AppRoutes.archive, page: () => Archive()),
  GetPage(name: AppRoutes.ordersdetails, page: () => Ordersdetails()),
  GetPage(name: AppRoutes.categoriesView, page: () => CategoriesView()),
  GetPage(name: AppRoutes.categoriesadd, page: () => Categoriesadd()),
  GetPage(name: AppRoutes.categoriesedit, page: () => Categoriesedit()),
  GetPage(name: AppRoutes.itemsview, page: () => Itemsview()),
  GetPage(name: AppRoutes.itemsadd, page: () => Itemsadd()),
  GetPage(name: AppRoutes.itemsedit, page: () => Itemsedit()),
  GetPage(name: AppRoutes.offeradd, page: () => Offeradd()),
  GetPage(name: AppRoutes.offerview, page: () => Offerview()),
  GetPage(name: AppRoutes.languageinapp, page: () => Langugeinapp()),
  // GetPage(name: AppRoutes.offeredit, page: () => Offeredit()),
  GetPage(name: AppRoutes.delivaryaccountadd, page: () => Delivaryaccountadd()),
  GetPage(name: AppRoutes.delivaryaccountedit, page: () => Delivaryaccountedit()),
  GetPage(name: AppRoutes.delivaryaccountview, page: () => Delivaryaccountview()),
  GetPage(name: AppRoutes.adminaccountadd, page: () => Adminaccountadd()),
  GetPage(name: AppRoutes.adminaccountedit, page: () => Adminaccountedit()),
  GetPage(name: AppRoutes.adminaccountview, page: () => Adminaccountview()),
  GetPage(name: AppRoutes.coponadd, page: () => Coponadd()),
  GetPage(name: AppRoutes.coponedit, page: () => Coponedit()),
  GetPage(name: AppRoutes.coponview, page: () => Coponview()),
  GetPage(name: AppRoutes.notofication, page: () => Notification()),
  GetPage(name: AppRoutes.ordersrating, page: () => Ordersrating()),
  GetPage(name: AppRoutes.delivaryview, page: () => Delivarypriceview()),
  GetPage(name: AppRoutes.delivaryedit, page: () => Delivarypriceedit()),
];
