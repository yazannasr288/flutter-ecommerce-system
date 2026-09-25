// import 'package:admin/controller/offers/editcontroller.dart';
// import 'package:admin/core/class/handlingdataview.dart';
// import 'package:admin/core/shared/custombutton.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class Offeredit extends StatelessWidget {
//   const Offeredit({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     OfferEditcontroller controller = Get.put(OfferEditcontroller());
//     return Scaffold(
//       appBar: AppBar(title: Text("214".tr)),
//       body: GetBuilder<OfferEditcontroller>(
//         builder:
//             (controller) => Handlingdataview(
//               statusRequest: controller.statusRequest,
//               widget: Center(
//                 child: Column(
//                   children: [
//                     SizedBox(height: 200,),
//                     ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.purpleAccent,
//                           ),
//                           onPressed: () {
//                             controller.showoptionImage();
//                           },
//                           child: Text(
//                             "213".tr,
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                     if (controller.file != null)
//                       Container(
//                         height: 70,
//                         child: (Image.file(controller.file!)),
//                       ),
//                     SizedBox(height: 20),
//                     Custombutton(
//                       text: "201".tr,
//                       onPressed: () {
//                         controller.editData();
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//
//
//             ),
//       ),
//     );
//   }
// }
