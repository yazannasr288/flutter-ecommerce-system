import 'package:ecommerse/linkapi.dart';

import '../../../../core/class/crud.dart';

class VerifiycodesignupData {
  Crud crud;

  VerifiycodesignupData(this.crud);

  postData(String email, String verifiycode) async {
    var response = await crud.postData(AppLink.verifiycodesignup, {
      "email": email,
      "verifiycode": verifiycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resend, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
