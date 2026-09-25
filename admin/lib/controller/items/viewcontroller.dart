import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/itemsdata.dart';
import '../handlingdatacontroller.dart';

class ItemsViewcontroller extends GetxController {
  Itemsdata itemsdata = Itemsdata(Get.find());
  List<ItemsModel> data = [];
  List<ItemsModel> filteredItems = [];

  late StatusRequest statusRequest;
  String currentFilter = "id";

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    data.clear();
    filteredItems.clear();
    update();

    statusRequest = StatusRequest.loading;
    update();

    var response = await itemsdata.getData();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
        applyFilter();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  void applyFilter() {
    filteredItems = [...data];

    switch (currentFilter) {
      case "price":
        filteredItems.sort(
              (a, b) => double.parse(b.itemsPrice!).compareTo(double.parse(a.itemsPrice!)),
        );
        break;

      case "category":
        filteredItems.sort(
              (a, b) => a.categoriesName!.compareTo(b.categoriesName!),
        );
        break;

      case "id":
      default:
        filteredItems.sort(
              (a, b) => a.itemsId!.compareTo(b.itemsId!),
        );
        break;
    }

    update();
  }

  void setFilter(String filter) {
    if (filter != currentFilter) {
      currentFilter = filter;
      applyFilter();
    }
  }

  void deleteitems(String id, String imagename) {
    itemsdata.delete({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.itemsId == id);
    applyFilter();
  }

  void gotopageedit(ItemsModel itemsmodel) {
    Get.toNamed(
      AppRoutes.itemsedit,
      arguments: {"itemsModel": itemsmodel},
    );
  }

  Future<bool> myback() async {
    Get.offAllNamed(AppRoutes.homepage);
    return true;
  }
}
