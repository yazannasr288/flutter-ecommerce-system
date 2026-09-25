// import 'package:ecommerse/core/class/statusrequest.dart';
// import 'package:ecommerse/data/datasource/remote/test_data.dart';
// import 'package:get/get.dart';
//
// import '../core/function/handlingdatacontroller.dart';
//
// class TextController extends GetxController {
//   TestData testData = TestData(Get.find());
//
//   List data = [];
//   late StatusRequest statusRequest;
//
//   getData() async {
//     statusRequest = StatusRequest.loading;
//     var response = await testData.getData();
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         // data.add(response);
//         data.addAll(response['data']);
//       }
//       else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }
//
//   @override
//   void onInit() {
//     getData();
//     super.onInit();
//   }
// }
