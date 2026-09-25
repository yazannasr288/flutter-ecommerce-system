import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/data/model/offersmodel.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/offersdata.dart';
import '../handlingdatacontroller.dart';

class OfferViewcontroller extends GetxController {
  Offersdata offersdata = Offersdata(Get.find());
  late StatusRequest statusRequest;
  List<Offersmodel> data = [];

  Future<void> getData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await offersdata.getData();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data = datalist.map((e) => Offersmodel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void deleteitems(String id, String imagename) async {
    await offersdata.delete({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.id == id);
    update();
  }

  void gotopageedit(Offersmodel offermodel) {
    Get.toNamed(
      AppRoutes.offeredit,
      arguments: {"surpricemodel": offermodel},
    );
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<bool> myback() async {
    Get.offAllNamed(AppRoutes.homepage);
    return true;
  }
}
