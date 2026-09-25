import 'package:admin/linkapi.dart';

import '../../../../core/class/crud.dart';

class OrdersArchiveData {
  Crud crud;

  OrdersArchiveData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.archive, {});
    return response.fold((l) => l, (r) => r);
  }

  // ratingdata(String ordersid, String comment, String rating) async {
  //   var response = await crud.postData(AppLink., {
  //     "id": ordersid,
  //     "rating": rating,
  //     "comment": comment,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }
}
