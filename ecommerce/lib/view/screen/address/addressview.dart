import 'package:ecommerse/core/class/handlingdataview.dart';
import 'package:ecommerse/core/constant/color.dart';
import 'package:ecommerse/core/constant/routes.dart';
import 'package:ecommerse/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controler/address/viewcontroller.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
      appBar: AppBar(title: Text("88".tr)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offNamed(AppRoutes.addressadd);
        },
        child: Icon(Icons.add),
      ),
      body: Stack(
        children: [
          GetBuilder<AddressViewController>(
            builder:
                (controller) => Handlingdataview(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, i) {
                        return CardAddress(
                          addressModel: controller.data[i],
                          onDelete: () {
                            controller.DeleteAddress(
                              controller.data[i].addressId!,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor),
                onPressed: () {
                  Get.offAllNamed(AppRoutes.homepage);
                },
                child: Text(
                  "97".tr,
                  style: TextStyle(color: AppColor.white, fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;

  const CardAddress({super.key, required this.addressModel, this.onDelete});

  @override
  Widget build(BuildContext context) {
    AddressViewController controller = Get.put(AddressViewController());

    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Row(
            children: [
              Text(
                "98".tr,
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(width: 5),
              Flexible(
                child: Text(
                  "${addressModel.addressName!}",
                ),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Text(
                          "99".tr,
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            "${addressModel.addressCity!}",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Row(
                      children: [
                        Text(
                          "100".tr,
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            "${addressModel.addressStreet!}",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "101".tr,
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      "${addressModel.addressnote!}",
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: controller.showEdit
              ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onDelete,
                icon: Icon(Icons.delete_outlined),
              ),
              IconButton(
                onPressed: () {
                  Get.toNamed(
                    AppRoutes.addressAdddetails,
                    arguments: {
                      "isEdit": true,
                      "addressModel": addressModel,
                    },
                  );
                },
                icon: Icon(Icons.edit, color: AppColor.primaryColor),
              ),
            ],
          )
              : null,
        ),
      ),
    );
  }
}

