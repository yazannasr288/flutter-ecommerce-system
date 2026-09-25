import 'package:get/get.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';

import '../../data/datasource/remote/delivarypricedata.dart';
import 'package:admin/data/model/delivarypricemodel.dart';
import '../handlingdatacontroller.dart';

class DelivarypriceViewcontroller extends GetxController {
  final Delivarypricedata delivarypricedata = Delivarypricedata(Get.find());
  final List<Delivarypricemodel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  Future<void> getData() async {
    data.clear();
    update();

    statusRequest = StatusRequest.loading;
    final response = await delivarypricedata.getData();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        final datalist = response['data'] as List;
        data.addAll(datalist.map((e) => Delivarypricemodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void gotopageedit(Delivarypricemodel delivarypricemodel) {
    Get.toNamed(
      AppRoutes.delivaryedit,
      arguments: {"delivarypriceModel": delivarypricemodel},
    );
  }

  Future<bool> myback() async {
    Get.offAllNamed(AppRoutes.homepage);
    return true;
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
