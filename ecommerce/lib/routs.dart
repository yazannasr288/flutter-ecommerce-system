
import 'package:ecommerse/view/screen/aboutus.dart';
import 'package:ecommerse/view/screen/address/add.dart';
import 'package:ecommerse/view/screen/address/adddetails.dart';

import 'package:ecommerse/view/screen/address/addressview.dart';
import 'package:ecommerse/view/screen/cart.dart';
import 'package:ecommerse/view/screen/changelang.dart';
import 'package:ecommerse/view/screen/checkout.dart';
import 'package:ecommerse/view/screen/forgetpassword/resetpassword.dart';
import 'package:ecommerse/view/screen/forgetpassword/successresetpassword.dart';
import 'package:ecommerse/view/screen/auth/successsignup.dart';
import 'package:ecommerse/view/screen/auth/verifiycodesignup.dart';
import 'package:ecommerse/view/screen/forgetpassword/veryfiicode.dart';
import 'package:ecommerse/view/screen/OnBoarding.dart';
import 'package:ecommerse/view/screen/forgetpassword/forgetpassword.dart';
import 'package:ecommerse/view/screen/auth/signup.dart';
import 'package:ecommerse/view/screen/homescreen.dart';
import 'package:ecommerse/view/screen/items.dart';
import 'package:ecommerse/view/screen/languge.dart';
import 'package:ecommerse/view/screen/myfavorite.dart';
import 'package:ecommerse/view/screen/offer.dart';
import 'package:ecommerse/view/screen/orders/archive.dart';
import 'package:ecommerse/view/screen/orders/ordersdetails.dart';
import 'package:ecommerse/view/screen/orders/panding.dart';
import 'package:ecommerse/view/screen/productdetails.dart';
import 'package:ecommerse/view/screen/settings.dart';
import 'package:get/get.dart';
import 'core/constant/routes.dart';
import 'core/midellware/mymidelware.dart';
import 'view/screen/auth/login.dart';

List<GetPage<dynamic>>? route = [
  GetPage(name: "/", page: () => Language(), middlewares: [Mymidelware()]),
  GetPage(name: AppRoutes.cart, page: () => Cart()),
  GetPage(name: AppRoutes.login, page: () => Login()),
  GetPage(name: AppRoutes.onBoarding, page: () => OnBoarding()),
  GetPage(name: AppRoutes.signUp, page: () => SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoutes.verifiyCode, page: () => Verifiycode()),
  GetPage(name: AppRoutes.homepage, page: () => Homescreen()),

  GetPage(name: AppRoutes.restPasswoed, page: () => Resetpassword()),
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => SuccessResetPassword(),
  ),
  GetPage(name: AppRoutes.successSignup, page: () => Successsignup()),
  GetPage(name: AppRoutes.verifiyCodeeSignUp, page: () => Verifiycodesignup()),
  GetPage(name: AppRoutes.items, page: () => Items()),
  GetPage(name: AppRoutes.productdetails, page: () => Productdetails()),
  GetPage(name: AppRoutes.myfavorite, page: () => Myfavorite()),
  GetPage(name: AppRoutes.addressadd, page: () => AddressAdd()),
  GetPage(name: AppRoutes.addressAdddetails, page: () => AddressAdddetails()),
  GetPage(name: AppRoutes.addressview, page: () => AddressView()),
  GetPage(name: AppRoutes.checkout, page: () => Checkout()),
  GetPage(name: AppRoutes.panding, page: () => Panding()),
  GetPage(name: AppRoutes.archive, page: () => Archive()),
  GetPage(name: AppRoutes.ordersdetails, page: () => Ordersdetails()),
  GetPage(name: AppRoutes.offer, page: () => Offer()),
  GetPage(name: AppRoutes.setting, page: () => Settings()),
  GetPage(name: AppRoutes.changlang, page: () => Changelang()),
  GetPage(name: AppRoutes.aboutus, page: () =>Aboutus()),
];
