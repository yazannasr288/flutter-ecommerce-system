import 'package:get/get.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/data/datasource/remote/categoriesdata.dart';
import 'package:admin/data/model/categoriesmodel.dart';

import '../handlingdatacontroller.dart';

class CatViewcontroller extends GetxController {
  final Categoriesdata categoriesdata = Categoriesdata(Get.find());
  final List<CategoriesModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  Future<void> getData() async {
    data.clear();
    update();

    statusRequest = StatusRequest.loading;
    final response = await categoriesdata.getData();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        final datalist = response['data'] as List;
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> deletecata(String id, String imagename) async {
    await categoriesdata.delete({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.categoriesId == id);
    update();
  }

  void gotopageedit(CategoriesModel categoriesModel) {
    Get.toNamed(
      AppRoutes.categoriesedit,
      arguments: {"categoriesModel": categoriesModel},
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
