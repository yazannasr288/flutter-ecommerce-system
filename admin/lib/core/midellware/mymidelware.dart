import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymidelware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {

    if (myServices.sharedPreferences.getString("step") == "2") {
      return RouteSettings(name: AppRoutes.homepage);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return RouteSettings(name: AppRoutes.login);
    }


    return null;
  }
}
