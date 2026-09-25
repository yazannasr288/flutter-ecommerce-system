import 'package:ecommerse/core/constant/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../function/fcmconfig.dart';
import '../services/services.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();
  ThemeData apptheme = themeDataEnglish;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    apptheme = langcode == "ar" ? themeDataArabic : themeDataEnglish;
    Get.changeTheme(apptheme);
    Get.updateLocale(locale);
  }

  requestPermation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("63".tr, "");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      return Get.snackbar("63".tr, "");
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("63".tr, "");
    }
  }

  @override
  void onInit() {
    requestpermationnotifi();
    fcmconfig();
    requestPermation();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = Locale("ar");
      apptheme = themeDataArabic;
    } else if (sharedPrefLang == "en") {
      language = Locale("en");
      apptheme = themeDataEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      apptheme = themeDataEnglish;
    }

    super.onInit();
  }
}
