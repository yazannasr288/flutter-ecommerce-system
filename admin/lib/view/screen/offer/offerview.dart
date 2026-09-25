import 'package:admin/controller/offers/viewcontroller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes.dart';

class Offerview extends StatelessWidget {
  const Offerview({super.key});

  @override
  Widget build(BuildContext context) {
    final OfferViewcontroller controller = Get.put(OfferViewcontroller());
    return Scaffold(
      appBar: AppBar(title: Text("226".tr)),
      floatingActionButton: GetBuilder<OfferViewcontroller>(
        builder: (_) {
          final bool noImages = controller.data.isEmpty ||
              controller.data.every((element) => element.image == null);

          if (noImages) {
            return FloatingActionButton(
              onPressed: () => Get.toNamed(AppRoutes.offeradd),
              child: const Icon(Icons.add),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      body: GetBuilder<OfferViewcontroller>(
        builder: (_) => Handlingdataview(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                final offer = controller.data[index];
                return Column(
                  children: [
                    Row(
                      children: [
                        CachedNetworkImage(
                          height: 150,
                          width: 300,
                          imageUrl: "${AppLink.imageoffers}/${offer.image}",
                          placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: "63".tr,
                              middleText: "202".tr,
                              onCancel: () {},
                              onConfirm: () {
                                controller.deleteitems(offer.id!, offer.image!);
                                Get.back();
                              },
                            );
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
