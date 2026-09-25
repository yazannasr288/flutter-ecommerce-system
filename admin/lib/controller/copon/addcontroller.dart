import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:admin/controller/copon/viewcontroller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';

import '../../data/datasource/remote/copondata.dart';
import '../handlingdatacontroller.dart';

class CoponAddcontroller extends GetxController {
  final Copondata copondata = Copondata(Get.find());
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late final TextEditingController coponname;
  late final TextEditingController coponcount;
  late final TextEditingController copondiscount;
  late final TextEditingController copondate;

  StatusRequest statusRequest = StatusRequest.none;

  Future<void> addData() async {
    if (!formstate.currentState!.validate()) return;

    update();

    final data = {
      "coponname": coponname.text,
      "coponcount": coponcount.text,
      "copondiscount": copondiscount.text,
      "copondate": copondate.text,
    };

    statusRequest = StatusRequest.loading;

    final response = await copondata.add(data);
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
