import 'package:get/get.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';

import '../../data/datasource/remote/delivaryaccount.dart';
import 'package:admin/data/model/delivarymodel.dart';
import '../handlingdatacontroller.dart';

class DelivaryViewcontroller extends GetxController {
  final DelivaryAccountData delivaryAccountData = DelivaryAccountData(Get.find());
  final List<DelivaryModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  Future<void> getData() async {
    data.clear();
    update();

    statusRequest = StatusRequest.loading;
    final response = await delivaryAccountData.getData();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        final datalist = response['data'] as List;
        data.addAll(datalist.map((e) => DelivaryModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  String printorderstatus(String val) {
    return val == "0" ? "235".tr : "234".tr;
  }

  Future<void> deletedelivary(String id) async {
    await delivaryAccountData.delete({"id": id});
    data.removeWhere((element) => element.id == id);
    update();
  }

  void gotopageedit(DelivaryModel delivarymodel) {
    Get.toNamed(
      AppRoutes.delivaryaccountedit,
      arguments: {"delivaryModel": delivarymodel},
    );
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<bool> myback() async {
    Get.offAllNamed(AppRoutes.homepage);
    return true;
  }
}
