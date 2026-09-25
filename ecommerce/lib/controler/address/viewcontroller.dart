import 'package:ecommerse/core/services/services.dart';
import 'package:ecommerse/data/datasource/remote/addressdata.dart';
import 'package:ecommerse/data/model/addressmodel.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../handlingdatacontroller.dart';

class AddressViewController extends GetxController {
  Addressdata addressdata = Addressdata(Get.find());

  List<AddressModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  DeleteAddress(String addressid) {
    addressdata.deletedata(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressdata.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.clear();

        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        if(data.isEmpty){
          statusRequest=StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  bool showEdit = true;

  @override
  void onInit() {
    var args = Get.arguments;
    if (args != null && args["from"] == "add") {
      showEdit = false;
    }
    getData();
    super.onInit();
  }
}
