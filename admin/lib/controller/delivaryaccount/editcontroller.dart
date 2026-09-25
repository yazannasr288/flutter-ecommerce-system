import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:admin/controller/delivaryaccount/viewcontroller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';

import '../../data/datasource/remote/delivaryaccount.dart';
import 'package:admin/data/model/delivarymodel.dart';
import '../handlingdatacontroller.dart';

class DelivaryEditcontroller extends GetxController {
  final DelivaryAccountData delivaryAccountData = DelivaryAccountData(Get.find());
  DelivaryModel? delivaryModel;

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late final TextEditingController username;
  late final TextEditingController password;
  late final TextEditingController email;
  late final TextEditingController phone;

  String? aproove;

  StatusRequest statusRequest = StatusRequest.none;

  void changestateactive(val) {
    aproove = val;
    update();
  }

  Future<void> editData() async {
    if (!formstate.currentState!.validate()) return;

    update();

    final data = {
      "username": username.text,
      "aproove": aproove,
      "email": email.text,
      "password": password.text,
      "phone": phone.text,
      "id": delivaryModel!.id!,
      "datenow": DateTime.now().toString(),
    };

    statusRequest = StatusRequest.loading;

    final response = await delivaryAccountData.edit(data);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.delivaryaccountview);
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

    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();

    delivaryModel = Get.arguments['delivaryModel'];

    username.text = delivaryModel!.name!;
    aproove = delivaryModel!.aproove!;

    password.text = delivaryModel!.password!;
    email.text = delivaryModel!.email!;
    phone.text = delivaryModel!.phone!;
  }

  @override
  void onClose() {
    username.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    super.onClose();
  }
}
