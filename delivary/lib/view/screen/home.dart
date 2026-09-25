import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homecontroller.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    HomecontrollerImp controller = Get.put(HomecontrollerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'.tr), // يمكنك استخدام "1".tr أو أي مفتاح ترجمة
        centerTitle: true,
      ),
      body: GetBuilder<HomecontrollerImp>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: ListView(
            children: [
              // مثال: عنصر ترحيبي
              Text(
                "Welcome back!",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              // يمكن إضافة عناصر مثل بطاقات أو إحصائيات أو قوائم
              // مثال بسيط:
              Card(
                child: ListTile(
                  title: Text("طلبات معلقة"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // انتقال لصفحة الطلبات المعلقة
                    // Get.toNamed(AppRoutes.panding);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
