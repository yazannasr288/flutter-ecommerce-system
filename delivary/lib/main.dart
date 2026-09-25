import 'package:delivary/core/localisation/changelocal.dart';
import 'package:delivary/core/localisation/translation.dart';
import 'package:delivary/core/services/services.dart';
import 'package:delivary/initialbinding/initialbinding.dart';
import 'package:delivary/routs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/class/crud.dart';

void main() async {

  Get.put(Crud());

  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await Firebase.initializeApp();

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
      title: 'DELIVERY SYRIAN MALL',
      locale: controller.language,
      theme: controller.apptheme,
      initialBinding: InitialBinding(),
      getPages: route,
    );
  }
}
