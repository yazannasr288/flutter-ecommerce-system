import 'package:get/get.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';

import '../../data/datasource/remote/copondata.dart';
import '../../data/model/couponmodel.dart';
import '../handlingdatacontroller.dart';

class CoponViewcontroller extends GetxController {
  final Copondata copondata = Copondata(Get.find());
  final List<CoponModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  Future<void> getData() async {
    data.clear();
    update();

    statusRequest = StatusRequest.loading;
    final response = await copondata.getData();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        final datalist = response['data'] as List;
        data.addAll(datalist.map((e) => CoponModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> deletecopon(String id) async {
    await copondata.delete({"id": id});
    data.removeWhere((element) => element.coponId == id);
    update();
  }

  void gotopageedit(CoponModel coponmodel) {
    Get.toNamed(
      AppRoutes.coponedit,
      arguments: {"coponModel": coponmodel},
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
