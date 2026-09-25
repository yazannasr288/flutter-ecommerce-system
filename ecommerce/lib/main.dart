import 'package:ecommerse/core/localisation/changelocal.dart';
import 'package:ecommerse/core/localisation/translation.dart';
import 'package:ecommerse/core/services/services.dart';
import 'package:ecommerse/initialbinding/initialbinding.dart';
import 'package:ecommerse/routs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/class/crud.dart';
import 'core/function/fcmconfig.dart';

void main() async {
  Get.put(Crud());

  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await Firebase.initializeApp();
  await requestpermationnotifi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.apptheme,
       initialBinding:InitialBinding() ,

      getPages: route,
    );
  }
}
