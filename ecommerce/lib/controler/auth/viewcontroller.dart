// import 'package:admin/core/class/statusrequest.dart';
// import 'package:admin/core/constant/routes.dart';
// import 'package:admin/data/model/delivarymodel.dart';
// import 'package:get/get.dart';
//
// import '../../data/datasource/remote/delivaryaccount.dart';
// import '../handlingdatacontroller.dart';
//
// class DelivaryViewcontroller extends GetxController {
//   DelivaryAccountData delivaryAccountData = DelivaryAccountData(Get.find());
//   List<DelivaryModel> data = [];
//   late StatusRequest statusRequest;
//
//   getData() async {
//     data.clear();
//     update();
//     statusRequest = StatusRequest.loading;
//     var response = await delivaryAccountData.getData();
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         List datalist = response['data'];
//         data.addAll(datalist.map((e) => DelivaryModel.fromJson(e)));
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }
//   String printorderstatus(String val) {
//     if (val == "0") {
//       return "235".tr;
//     } else {
//       return "234".tr;
//     }
//   }
//
//   deletedelivary(String id) {
//     delivaryAccountData.delete({"id": id});
//     data.removeWhere((element) => element.id == id);
//     update();
//   }
//
//   gotopageedit(DelivaryModel delivarymodel) {
//     Get.toNamed(
//       AppRoutes.delivaryaccountedit,
//       arguments: {"delivaryModel": delivarymodel},
//     );
//   }
//
//   @override
//   void onInit() {
//     getData();
//     super.onInit();
//   }
//
//   myback() {
//     Get.offAllNamed(AppRoutes.homepage);
//     return Future.value(true);
//   }
// }
