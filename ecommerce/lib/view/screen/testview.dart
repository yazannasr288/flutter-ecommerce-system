// import 'package:ecommerse/core/class/handlingdataview.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../controler/testcontroller.dart';
//
// class Testview extends StatelessWidget {
//   const Testview({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(TextController());
//     return Scaffold(
//       appBar: AppBar(title: Text("data")),
//       body: GetBuilder<TextController>(
//         builder: (controller) {
//           return Handlingdataview(
//             statusRequest: controller.statusRequest,
//             widget: ListView.builder(
//               itemCount: controller.data.length,
//               itemBuilder: (context, index) {
//                 return Text("${controller.data}");
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
