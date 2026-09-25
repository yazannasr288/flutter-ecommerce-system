import 'package:admin/linkapi.dart';

import '../../../../core/class/crud.dart';

class PandingData {
  Crud crud;

  PandingData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.panding, {});
    return response.fold((l) => l, (r) => r);
  }

  approveData( String userid, String orderid) async {
    var response = await crud.postData(AppLink.approve, {
      "usersid": userid,
      "ordersid": orderid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
