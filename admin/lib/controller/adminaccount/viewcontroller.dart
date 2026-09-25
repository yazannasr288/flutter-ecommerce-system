import 'package:get/get.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/data/model/adminmodel.dart';

import '../../data/datasource/remote/adminaccount.dart';
import '../handlingdatacontroller.dart';

class AdminViewcontroller extends GetxController {
  final AdminAccountData adminAccountData = AdminAccountData(Get.find());
  final List<AdminModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  Future<void> getData() async {
    data.clear();
    update();

    statusRequest = StatusRequest.loading;
    final response = await adminAccountData.getData();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        final datalist = response['data'] as List;
        data.addAll(datalist.map((e) => AdminModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  String printorderstatus(String val) => val == "0" ? "235".tr : "234".tr;

  Future<void> deleteadmin(String id) async {
    await adminAccountData.delete({"id": id});
    data.removeWhere((element) => element.id == id);
    update();
  }

  void gotopageedit(AdminModel adminmodel) {
    Get.toNamed(
      AppRoutes.adminaccountedit,
      arguments: {"adminModel": adminmodel},
    );
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<bool> myback() {
    Get.offAllNamed(AppRoutes.homepage);
    return Future.value(true);
  }
}
