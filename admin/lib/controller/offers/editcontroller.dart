import 'dart:io';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/uploadfile.dart';
import 'package:get/get.dart';
import '../../data/datasource/remote/offersdata.dart';
import '../handlingdatacontroller.dart';

class OfferEditcontroller extends GetxController {
  Offersdata offersdata = Offersdata(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  File? file;

  void showoptionImage() {
    showbottommenu(chooseimagecamera, chooseimagegallary);
  }

  Future<void> chooseimagecamera() async {
    file = await imageUploadCamera();
    update();
  }

  Future<void> chooseimagegallary() async {
    file = await fileUploadGallery(false);
    update();
  }

  Future<void> editData() async {
    statusRequest = StatusRequest.loading;
    update();

    Map<String, dynamic> data = {}; // أضف حقول التعديل هنا عند الحاجة

    var response = await offersdata.edit(data, file);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.offerview);
        // لو حبيت تحدث بيانات العرض بعدها ممكن تفعيل السطر التالي:
        // OfferViewcontroller c = Get.find();
        // c.getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
