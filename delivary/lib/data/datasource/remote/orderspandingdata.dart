import 'package:delivary/linkapi.dart';

import '../../../core/class/crud.dart';

class PandingData {
  Crud crud;

  PandingData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.panding, {});
    return response.fold((l) => l, (r) => r);
  }

  approveData(String delivaryid, String userid, String orderid) async {
    var response = await crud.postData(AppLink.approve, {
      "delivaryid": delivaryid,
      "usersid": userid,
      "ordersid": orderid,
    });
    return response.fold((l) => l, (r) => r);
  }
  checkApprove(String delivaryid) async {
    var response = await crud.postData(AppLink.signout, {
      "id": delivaryid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
