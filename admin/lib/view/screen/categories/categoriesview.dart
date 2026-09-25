// ignore_for_file: deprecated_member_use

import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/categories/viewcontroller.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CatViewcontroller());
    return Scaffold(
      appBar: AppBar(title: Text("203".tr)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.categoriesadd),
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<CatViewcontroller>(
        builder: (controller) => Handlingdataview(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
            onWillPop: controller.myback,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  final item = controller.data[index];
                  return InkWell(
                    onTap: () => controller.gotopageedit(item),
                    child: Card(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              child: SvgPicture.network(
                                "${AppLink.imagestCategories}/${item.categoriesImage}",
                                height: 50,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: ListTile(
                              title: Text(item.categories_name ?? ""),
                              subtitle: Text(item.categories_name_ar ?? ""),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      Get.defaultDialog(
                                        title: "63".tr,
                                        middleText: "202".tr,
                                        onCancel: () {},
                                        onConfirm: () {
                                          controller.deletecata(
                                            item.categoriesId!,
                                            item.categoriesImage!,
                                          );
                                          Get.back();
                                        },
                                      );
                                    },
                                  ),
                                  // إذا أردت تفعيل زر التعديل، يمكنك إلغاء التعليق هنا
                                  // IconButton(
                                  //   icon: const Icon(Icons.edit),
                                  //   onPressed: () => controller.gotopageedit(item),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
