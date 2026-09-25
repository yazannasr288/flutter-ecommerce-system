import 'package:admin/core/localisation/changelocal.dart';
import 'package:admin/core/localisation/translation.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/initialbinding/initialbinding.dart';
import 'package:admin/routs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/class/crud.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();
  await Firebase.initializeApp();

  Get.put(Crud(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LocalController controller = Get.put(LocalController(), permanent: true);

    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'ADMIN SYRIAN MALL',
      locale: controller.language,
      theme: controller.apptheme,
      initialBinding: InitialBinding(),
      getPages: route,
    );
  }
}
