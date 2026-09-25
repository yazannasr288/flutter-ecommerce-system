import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:admin/controller/copon/viewcontroller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';

import '../../data/datasource/remote/copondata.dart';
import '../../data/model/couponmodel.dart';
import '../handlingdatacontroller.dart';

class CoponEditcontroller extends GetxController {
  final Copondata copondata = Copondata(Get.find());
  CoponModel? coponModel;

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late final TextEditingController coponname;
  late final TextEditingController coponcount;
  late final TextEditingController copondiscount;
  late final TextEditingController copondate;

  StatusRequest statusRequest = StatusRequest.none;

  Future<void> editData() async {
    if (!formstate.currentState!.validate()) return;

    update();

    final data = {
      "coponname": coponname.text,
      "coponcount": coponcount.text,
      "copondiscount": copondiscount.text,
      "copondate": copondate.text,
      "id": coponModel!.coponId!,
    };

    statusRequest = StatusRequest.loading;

    final response = await copondata.edit(data);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.coponview);
        Get.find<CoponViewcontroller>().getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final fullDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
          0,
        );

        copondate.text = fullDateTime.toString().split('.').first;
      }
    }
  }

  @override
  void onInit() {
    coponname = TextEditingController();
    coponcount = TextEditingController();
    copondiscount = TextEditingController();
    copondate = TextEditingController();

    coponModel = Get.arguments['coponModel'];
    coponname.text = coponModel!.coponName!;
    coponcount.text = coponModel!.coponCount!;
    copondiscount.text = coponModel!.coponDiscount!;
    copondate.text = coponModel!.copondate!;

    super.onInit();
  }

  @override
  void onClose() {
    coponname.dispose();
    coponcount.dispose();
    copondiscount.dispose();
    copondate.dispose();
    super.onClose();
  }
}
