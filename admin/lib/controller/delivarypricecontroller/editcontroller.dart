import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:admin/controller/delivaryaccount/viewcontroller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';

import '../../data/datasource/remote/delivarypricedata.dart';
import 'package:admin/data/model/delivarypricemodel.dart';
import '../handlingdatacontroller.dart';

class Delivarypriceeditcontroller extends GetxController {
  final Delivarypricedata delivarypricedata = Delivarypricedata(Get.find());
  Delivarypricemodel? delivarypricemodel;

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late final TextEditingController delivaryprice;

  StatusRequest statusRequest = StatusRequest.none;

  Future<void> editData() async {
    if (!formstate.currentState!.validate()) return;

    update();

    final data = {
      "delivaryprice": delivaryprice.text,
      "id": delivarypricemodel!.delivarypriceid!,
    };

    statusRequest = StatusRequest.loading;

    final response = await delivarypricedata.edit(data);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.delivaryview);
        Get.find<DelivaryViewcontroller>().getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
    delivaryprice = TextEditingController();

    delivarypricemodel = Get.arguments['delivarypriceModel'];
    delivaryprice.text = delivarypricemodel!.delivaryprice!;
  }

  @override
  void onClose() {
    delivaryprice.dispose();
    super.onClose();
  }
}
