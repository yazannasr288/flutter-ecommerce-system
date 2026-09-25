import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "48".tr;
  }
  if (val.length < min) {
    return "50".tr.replaceAll('{{min}}', min.toString());
  }
  if (val.length > max) {
    return "49".tr.replaceAll('{{max}}', max.toString());
  }

  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "45".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "46".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "47".tr;
    }
  }

}
