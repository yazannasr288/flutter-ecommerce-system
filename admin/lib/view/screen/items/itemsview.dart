// ignore_for_file: deprecated_member_use
import 'package:admin/core/function/translatedatabase.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:admin/controller/items/viewcontroller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Itemsview extends StatelessWidget {
  const Itemsview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ItemsViewcontroller());
    return Scaffold(
      appBar: AppBar(title: Text("217".tr)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.itemsadd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<ItemsViewcontroller>(
        builder: (_) => Handlingdataview(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
            onWillPop: controller.myback,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // Filter Chips to select sorting/filtering criteria
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilterChip(
                        label: Text("حسب ID"),
                        selected: controller.currentFilter == "id",
                        onSelected: (_) => controller.setFilter("id"),
                      ),
                      FilterChip(
                        label: Text("السعر الأعلى"),
                        selected: controller.currentFilter == "price",
                        onSelected: (_) => controller.setFilter("price"),
                      ),
                      FilterChip(
                        label: Text("حسب القسم"),
                        selected: controller.currentFilter == "category",
                        onSelected: (_) => controller.setFilter("category"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = controller.filteredItems[index];
                        return InkWell(
                          onTap: () {
                            controller.gotopageedit(item);
                          },
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // ID text
                                  Text(
                                    "#${item.itemsId}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 10),

                                  // Product image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                      "${AppLink.imagestItems}/${item.itemsImage}",
                                      width: 90,
                                      height: 90,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 10),

                                  // Name and category text
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          translateDatabase(
                                            item.itemsNameAr!,
                                            item.itemsName!,
                                          ),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          translateDatabase(
                                            item.categoriesNamaAr!,
                                            item.categoriesName!,
                                          ),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.blueGrey,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Delete button
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      Get.defaultDialog(
                                        title: "63".tr,
                                        middleText: "202".tr,
                                        onCancel: () {},
                                        onConfirm: () {
                                          controller.deleteitems(
                                            item.itemsId!,
                                            item.itemsImage!,
                                          );
                                          Get.back();
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
